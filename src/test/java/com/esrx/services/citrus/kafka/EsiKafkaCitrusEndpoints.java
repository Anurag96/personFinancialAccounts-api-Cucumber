package com.esrx.services.citrus.kafka;

import com.consol.citrus.dsl.endpoint.AsyncSyncEndpointBuilder;

public class EsiKafkaCitrusEndpoints {

    public static AsyncSyncEndpointBuilder<EsiKafkaEndpointBuilder, EsiKafkaEndpointBuilder> kafka() {
        return new AsyncSyncEndpointBuilder(new EsiKafkaEndpointBuilder(), new EsiKafkaEndpointBuilder());
    }

}
