package com.esrx.services.citrus.kafka;

import com.consol.citrus.endpoint.AbstractEndpointBuilder;
import com.consol.citrus.kafka.message.KafkaMessageConverter;
import com.consol.citrus.kafka.message.KafkaMessageHeaderMapper;
import org.apache.kafka.common.serialization.Deserializer;
import org.apache.kafka.common.serialization.Serializer;

import java.util.Map;

public class EsiKafkaEndpointBuilder extends AbstractEndpointBuilder<EsiKafkaEndpoint> {
    private EsiKafkaEndpoint endpoint = new EsiKafkaEndpoint();

    public EsiKafkaEndpointBuilder() {
    }

    protected EsiKafkaEndpoint getEndpoint() {
        return this.endpoint;
    }

    public EsiKafkaEndpointBuilder server(String server) {
        this.endpoint.getEndpointConfiguration().setServer(server);
        return this;
    }

    public EsiKafkaEndpointBuilder topic(String topicName) {
        this.endpoint.getEndpointConfiguration().setTopic(topicName);
        return this;
    }

    public EsiKafkaEndpointBuilder partition(int partition) {
        this.endpoint.getEndpointConfiguration().setPartition(partition);
        return this;
    }

    public EsiKafkaEndpointBuilder autoCommit(boolean autoCommit) {
        this.endpoint.getEndpointConfiguration().setAutoCommit(autoCommit);
        return this;
    }

    public EsiKafkaEndpointBuilder autoCommitInterval(int autoCommitInterval) {
        this.endpoint.getEndpointConfiguration().setAutoCommitInterval(autoCommitInterval);
        return this;
    }

    public EsiKafkaEndpointBuilder offsetReset(String offsetReset) {
        this.endpoint.getEndpointConfiguration().setOffsetReset(offsetReset);
        return this;
    }

    public EsiKafkaEndpointBuilder clientId(String clientId) {
        this.endpoint.getEndpointConfiguration().setClientId(clientId);
        return this;
    }

    public EsiKafkaEndpointBuilder consumerGroup(String group) {
        this.endpoint.getEndpointConfiguration().setConsumerGroup(group);
        return this;
    }

    public EsiKafkaEndpointBuilder messageConverter(KafkaMessageConverter messageConverter) {
        this.endpoint.getEndpointConfiguration().setMessageConverter(messageConverter);
        return this;
    }

    public EsiKafkaEndpointBuilder headerMapper(KafkaMessageHeaderMapper headerMapper) {
        this.endpoint.getEndpointConfiguration().setHeaderMapper(headerMapper);
        return this;
    }

    public EsiKafkaEndpointBuilder keySerializer(Class<? extends Serializer> serializer) {
        this.endpoint.getEndpointConfiguration().setKeySerializer(serializer);
        return this;
    }

    public EsiKafkaEndpointBuilder valueSerializer(Class<? extends Serializer> serializer) {
        this.endpoint.getEndpointConfiguration().setValueSerializer(serializer);
        return this;
    }

    public EsiKafkaEndpointBuilder keyDeserializer(Class<? extends Deserializer> deserializer) {
        this.endpoint.getEndpointConfiguration().setKeyDeserializer(deserializer);
        return this;
    }

    public EsiKafkaEndpointBuilder valueDeserializer(Class<? extends Deserializer> deserializer) {
        this.endpoint.getEndpointConfiguration().setValueDeserializer(deserializer);
        return this;
    }

    public EsiKafkaEndpointBuilder producerProperties(Map<String, Object> producerProperties) {
        this.endpoint.getEndpointConfiguration().setProducerProperties(producerProperties);
        return this;
    }

    public EsiKafkaEndpointBuilder consumerProperties(Map<String, Object> consumerProperties) {
        this.endpoint.getEndpointConfiguration().setConsumerProperties(consumerProperties);
        return this;
    }

    public EsiKafkaEndpointBuilder timeout(long timeout) {
        this.endpoint.getEndpointConfiguration().setTimeout(timeout);
        return this;
    }
}
