package com.esrx.services.citrus.kafka;

import com.consol.citrus.endpoint.AbstractEndpoint;
import com.consol.citrus.kafka.endpoint.KafkaEndpointConfiguration;
import com.consol.citrus.kafka.endpoint.KafkaProducer;
import org.springframework.beans.factory.DisposableBean;

public class EsiKafkaEndpoint extends AbstractEndpoint implements DisposableBean {
    private KafkaProducer kafkaProducer;
    private EsiKafkaConsumer kafkaConsumer;

    public EsiKafkaEndpoint() {
        super(new KafkaEndpointConfiguration());
    }

    public EsiKafkaEndpoint(KafkaEndpointConfiguration endpointConfiguration) {
        super(endpointConfiguration);
    }

    public EsiKafkaConsumer createConsumer() {
        if (this.kafkaConsumer == null) {
            this.kafkaConsumer = new EsiKafkaConsumer(this.getConsumerName(), this.getEndpointConfiguration());
        }

        return this.kafkaConsumer;
    }

    public KafkaProducer createProducer() {
        if (this.kafkaProducer == null) {
            this.kafkaProducer = new KafkaProducer(this.getProducerName(), this.getEndpointConfiguration());
        }

        return this.kafkaProducer;
    }

    public KafkaEndpointConfiguration getEndpointConfiguration() {
        return (KafkaEndpointConfiguration)super.getEndpointConfiguration();
    }

    public void destroy() throws Exception {
        if (this.kafkaConsumer != null) {
            this.kafkaConsumer.stop();
        }

    }
}
