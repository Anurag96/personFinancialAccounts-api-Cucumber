package com.esrx.services.citrus.kafka.config;

import com.consol.citrus.context.TestContext;
import com.consol.citrus.dsl.design.TestDesigner;
import com.consol.citrus.dsl.design.TestDesignerBeforeTestSupport;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.UUID;

import static com.esrx.services.citrus.kafka.config.KafkaConfig.GLOBAL_TRANSACTION_ID_CONFIG;

public class BeforeTest extends TestDesignerBeforeTestSupport {

    @Autowired
    protected TestContext testContext;

    @Override
    public void beforeTest(TestDesigner designer) {
        String globalTransactionId = UUID.randomUUID().toString();
        testContext.getGlobalVariables().put(GLOBAL_TRANSACTION_ID_CONFIG, globalTransactionId);
        designer.echo("the test globalTransactionId is " + globalTransactionId);
    }
}