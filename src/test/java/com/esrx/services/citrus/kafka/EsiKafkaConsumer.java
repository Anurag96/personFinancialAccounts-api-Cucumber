package com.esrx.services.citrus.kafka;

import com.consol.citrus.context.TestContext;
import com.consol.citrus.exceptions.ActionTimeoutException;
import com.consol.citrus.exceptions.CitrusRuntimeException;
import com.consol.citrus.kafka.endpoint.KafkaEndpointConfiguration;
import com.consol.citrus.message.Message;
import com.consol.citrus.messaging.AbstractMessageConsumer;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.time.Duration;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

public class EsiKafkaConsumer extends AbstractMessageConsumer {
    private static Logger log = LoggerFactory.getLogger(EsiKafkaConsumer.class);
    private static final int DEFAULT_MAX_POLL_RECORDS = 10;
    private static final String GLOBAL_TRANSACTION_ID_CONFIG = "globalTransactionId";
    protected final KafkaEndpointConfiguration endpointConfiguration;

    private org.apache.kafka.clients.consumer.KafkaConsumer<Object, Object> consumer;

    public EsiKafkaConsumer(String name, KafkaEndpointConfiguration endpointConfiguration) {
        super(name, endpointConfiguration);
        this.endpointConfiguration = endpointConfiguration;
        this.consumer = this.createConsumer();
    }

    public Message receive(TestContext context, long timeout) {
        String topic = context.replaceDynamicContentInString((String) Optional.ofNullable(this.endpointConfiguration.getTopic())
                .orElseThrow(() -> new CitrusRuntimeException(
                        "Missing Kafka topic to receive messages from - add topic to endpoint configuration")));
        if (log.isDebugEnabled()) {
            log.debug("Receiving Kafka message on topic: '" + topic);
            log.debug("Filtering for transaction id " + context.getGlobalVariables().get(GLOBAL_TRANSACTION_ID_CONFIG));
        }

        if (CollectionUtils.isEmpty(this.consumer.subscription())) {
            this.consumer.subscribe(Arrays.asList(StringUtils.commaDelimitedListToStringArray(topic)));
        }

        ConsumerRecords<Object, Object> records = this.consumer.poll(Duration.ofMillis(timeout));
        if (records.isEmpty()) {
            throw new ActionTimeoutException(String.format("Failed to receive message from Kafka topic '%s' - timeout after %s milliseconds", topic, timeout));
        } else {
             Message received = null;
             for (ConsumerRecord record : records) {
                 log.debug("Received message: (" + record.key() + ", " + record.value() + ") at offset " + record.offset());
                 if (record.toString().contains(context.getGlobalVariables().get(GLOBAL_TRANSACTION_ID_CONFIG).toString())) {
                     received = this.endpointConfiguration.getMessageConverter().convertInbound(record, this.endpointConfiguration, context);
                     context.onInboundMessage(received);
                     break;
                 }
             }
            this.consumer.commitSync(Duration.ofMillis(this.endpointConfiguration.getTimeout()));
            if (null == received) {
                throw new RuntimeException("Failed to receive required message on topic: '" + topic);
            } else {
                log.info("Received Kafka message [" + received + "] on topic: '" + topic);
            }
            return received;
        }
    }

    public void stop() {
        try {
            if (CollectionUtils.isEmpty(this.consumer.subscription())) {
                this.consumer.unsubscribe();
            }
        } finally {
            this.consumer.close(Duration.ofMillis(10000L));
        }

    }

    private org.apache.kafka.clients.consumer.KafkaConsumer<Object, Object> createConsumer() {
        Map<String, Object> consumerProps = new HashMap();
        consumerProps.put("client.id", Optional.ofNullable(this.endpointConfiguration.getClientId()).orElse("citrus_kafka_consumer_" + UUID.randomUUID().toString()));
        consumerProps.put("group.id", this.endpointConfiguration.getConsumerGroup());
        consumerProps.put("bootstrap.servers", Optional.ofNullable(this.endpointConfiguration.getServer()).orElse("localhost:9092"));
        consumerProps.put("max.poll.records", DEFAULT_MAX_POLL_RECORDS);
        consumerProps.put("enable.auto.commit", this.endpointConfiguration.isAutoCommit());
        consumerProps.put("auto.commit.interval.ms", this.endpointConfiguration.getAutoCommitInterval());
        consumerProps.put("auto.offset.reset", this.endpointConfiguration.getOffsetReset());
        consumerProps.put("key.deserializer", this.endpointConfiguration.getKeyDeserializer());
        consumerProps.put("value.deserializer", this.endpointConfiguration.getValueDeserializer());
        consumerProps.putAll(this.endpointConfiguration.getConsumerProperties());
        return new org.apache.kafka.clients.consumer.KafkaConsumer(consumerProps);
    }

    public void setConsumer(org.apache.kafka.clients.consumer.KafkaConsumer<Object, Object> consumer) {
        this.consumer = consumer;
    }

    public KafkaEndpointConfiguration getEndpointConfiguration() {
        return endpointConfiguration;
    }

    public org.apache.kafka.clients.consumer.KafkaConsumer<Object, Object> getConsumer() {
        return consumer;
    }

}
