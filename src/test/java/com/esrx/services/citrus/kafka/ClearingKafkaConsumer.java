package com.esrx.services.citrus.kafka;

import com.consol.citrus.context.TestContext;
import com.consol.citrus.exceptions.CitrusRuntimeException;
import com.consol.citrus.kafka.endpoint.KafkaEndpointConfiguration;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.time.Duration;
import java.util.Arrays;
import java.util.Optional;

public class ClearingKafkaConsumer {

    private static Logger log = LoggerFactory.getLogger(ClearingKafkaConsumer.class);

    private KafkaConsumer<Object, Object> consumer;
    private KafkaEndpointConfiguration endpointConfiguration;

    public ClearingKafkaConsumer(EsiKafkaConsumer kafkaConsumer) {
        this.consumer = kafkaConsumer.getConsumer();
        this.endpointConfiguration = kafkaConsumer.getEndpointConfiguration();
    }

    public void consumeAll(TestContext context, long timeout) {
        String topic = context.replaceDynamicContentInString(Optional.ofNullable(this.endpointConfiguration.getTopic())
                .orElseThrow(() -> new CitrusRuntimeException(
                        "Missing Kafka topic to receive messages from - add topic to endpoint configuration")));
        if (log.isDebugEnabled()) {
            log.debug("Receiving Kafka message on topic: '" + topic);
        }

        if (CollectionUtils.isEmpty(this.consumer.subscription())) {
            log.debug("consumer is subscribing to " + topic);
            this.consumer.subscribe(Arrays.asList(StringUtils.commaDelimitedListToStringArray(topic)),
                    new AlwaysSeekToEndListener<>(consumer, topic));
        }
        this.consumer.poll(Duration.ofMillis(5000));
        this.consumer.commitSync(Duration.ofMillis(this.endpointConfiguration.getTimeout()));
    }

}
