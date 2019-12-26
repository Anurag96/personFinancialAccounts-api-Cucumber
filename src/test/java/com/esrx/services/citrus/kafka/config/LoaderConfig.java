package com.esrx.services.citrus.kafka.config;

import com.consol.citrus.context.TestContextFactory;
import com.consol.citrus.validation.json.JsonTextMessageValidator;
import com.esrx.services.citrus.kafka.ClearingKafkaConsumer;
import com.esrx.services.citrus.kafka.EsiKafkaEndpoint;
import com.esrx.services.config.EndpointConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Import;

import javax.annotation.PostConstruct;

@Import(value = {KafkaConfig.class, EndpointConfig.class})
public class LoaderConfig {
    private static final int TIMEOUT = 5000;

    @Value("${doKafkaInit:true}")
    private boolean doKafkaInit;

    @Autowired
    private JsonTextMessageValidator jsonTextMessageValidator;

    @Autowired
    private EsiKafkaEndpoint consumerLatestTopicEndpoint;

    @Autowired
    private EsiKafkaEndpoint consumerChangeTopicEndpoint;

    @Autowired
    private ApplicationContext applicationContext;

    @PostConstruct
    public void setup() {
        jsonTextMessageValidator.strict(false);
        if (doKafkaInit) {
            doKafkaInit(consumerLatestTopicEndpoint);
            doKafkaInit(consumerChangeTopicEndpoint);
        }
    }

    private void doKafkaInit(EsiKafkaEndpoint consumerTopicEndpoint) {
        ClearingKafkaConsumer clearingKafkaConsumer = new ClearingKafkaConsumer(consumerTopicEndpoint.createConsumer());
        try {
            clearingKafkaConsumer.consumeAll(applicationContext.getBean(TestContextFactory.class).getObject(), TIMEOUT);
        } catch (Exception e) {
            System.out.println("caught Kafka exception: " + e.getMessage());
            System.out.println("initialized consumer");
        }
    }

}
