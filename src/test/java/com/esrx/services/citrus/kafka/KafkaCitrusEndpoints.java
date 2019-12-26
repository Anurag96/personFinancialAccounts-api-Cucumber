package com.esrx.services.citrus.kafka;

import com.consol.citrus.dsl.endpoint.AsyncSyncEndpointBuilder;
import com.consol.citrus.kafka.endpoint.KafkaEndpointBuilder;

public class KafkaCitrusEndpoints {

    public static AsyncSyncEndpointBuilder<KafkaEndpointBuilder, KafkaEndpointBuilder> kafka() {
        return new AsyncSyncEndpointBuilder(new KafkaEndpointBuilder(), new KafkaEndpointBuilder());
    }

}
