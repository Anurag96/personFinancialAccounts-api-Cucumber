package com.esrx.services.citrus.kafka.config;

import com.consol.citrus.kafka.endpoint.KafkaEndpoint;
import com.esrx.services.citrus.kafka.EsiKafkaCitrusEndpoints;
import com.esrx.services.citrus.kafka.EsiKafkaEndpoint;
import com.esrx.services.citrus.kafka.KafkaCitrusEndpoints;
import com.esrx.services.config.BeforeTest;
import org.apache.kafka.clients.CommonClientConfigs;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.config.SaslConfigs;
import org.apache.kafka.common.config.SslConfigs;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.kafka.core.DefaultKafkaProducerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.core.ProducerFactory;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import static com.esrx.services.citrus.kafka.config.KafkaConfig.CONFIG_ROOT;
import static com.esrx.services.citrus.kafka.config.KafkaConfig.KAFKA_CONN_PROPERTIES;

@PropertySource(value = KAFKA_CONN_PROPERTIES)
@PropertySource(value = CONFIG_ROOT + "${KAFKA_ENVIRONMENT}/" + KAFKA_CONN_PROPERTIES, ignoreResourceNotFound = true)
public class KafkaConfig {
    public static final Logger LOGGER = LoggerFactory.getLogger(KafkaConfig.class);
    public static final String KAFKA_CONN_PROPERTIES = "kafka-conn.properties";
    public static final String CONFIG_ROOT = "./config/";
    public static final String GLOBAL_TRANSACTION_ID_CONFIG = "globalTransactionId";

    private static final String SECURITY_PROTOCOL_SASL_SSL = "SASL_SSL";

    @Value("${kafka.environment}")
    private String environment;
    @Value("${kafka.consumer.group-id.change}")
    private String changeGroupId;
    @Value("${kafka.consumer.group-id.latest}")
    private String latestGroupId;

    @Value("${kafka.security.protocol:SASL_SSL}")
    private String securityProtocol;
    @Value("${kafka.userprincipal:}")
    private String userPrincipal;
    @Value("${kafka.bootstrap-servers}")
    private String bootstrapServers;
    @Value("${kafka.krbconf:}")
    private String krbConfigFileName;
    @Value("${kafka.keytab:}")
    private String keytabFileName;
    @Value("${kafka.producer-topic}")
    private String producerTopic;
    @Value("${kafka.consumer-latest-topic}")
    private String consumerLatestTopic;
    @Value("${kafka.consumer-change-topic}")
    private String consumerChangeTopic;
    @Value("${kafka.timeout:5000}")
    private long timeout;
    @Value("${kafka.sasl.mechanism:GSSAPI}")
    private String saslMechanism;
    @Value("${kafka.sasl.kerberos.service.name:}")
    private String saslKerberosServiceName;
    @Value("${kafka.security.auth.useSubjectCredsOnly:true}")
    private String securityAuthUseSubjectCredsOnly;
    @Value("${kafka.sslpassword:}")
    private String truststorePassword;
    @Value("${kafka.truststore:}")
    private String truststoreFileName;
    @Value("${kafka.consumer.auto-offset-reset}")
    private String autoOffsetReset;

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
        return new PropertySourcesPlaceholderConfigurer();
    }

    @Bean
    public Map<String, Object> kafkaProperties() {
        Properties properties = new Properties();

        try {
            properties.load(KafkaConfig.class.getClassLoader().getResourceAsStream(KAFKA_CONN_PROPERTIES));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new HashMap<String, Object>((Map) properties);
    }

    @Bean
    public KafkaEndpoint producerSyncTopicEndpoint() {
        Map<String, Object> kafkaProps = kafkaProperties();
        kafkaProps.putAll(producerConfigs());
        return KafkaCitrusEndpoints.kafka().asynchronous()
                .topic(producerTopic).producerProperties(kafkaProps)
                .build();
    }

    @Bean
    public EsiKafkaEndpoint consumerLatestTopicEndpoint() {
        return getKafkaEndpoint(consumerLatestTopic, latestGroupId);
    }

    @Bean
    public EsiKafkaEndpoint consumerChangeTopicEndpoint() {
        return getKafkaEndpoint(consumerChangeTopic, changeGroupId);
    }

    private EsiKafkaEndpoint getKafkaEndpoint(String topicName, String consumerGroupId) {
        Map<String, Object> kafkaProps = kafkaProperties();
        if (SECURITY_PROTOCOL_SASL_SSL.equals(securityProtocol)) {
            setSecurityCredentials(kafkaProps);
        }

        Map<String, Object> properties = consumerConfig();
        properties.put(ConsumerConfig.GROUP_ID_CONFIG, consumerGroupId);

        kafkaProps.putAll(properties);
        return EsiKafkaCitrusEndpoints.kafka().asynchronous()
                .topic(topicName).consumerProperties(kafkaProps)
                .timeout(timeout)
                .offsetReset(autoOffsetReset)
                .build();
    }

    @Bean
    public Map<String, Object> producerConfigs() {
        Map<String, Object> kafkaProperties = kafkaProperties();

        Map<String, Object> props = new HashMap<>(kafkaProperties);

        props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, this.bootstrapServers);
        props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
        props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class);

        if (SECURITY_PROTOCOL_SASL_SSL.equals(securityProtocol)) {
            setSecurityCredentials(props);
        }

        return props;
    }

    @Bean
    public Map<String, Object> consumerConfig() {
        Map<String, Object> properties = new HashMap<>();
        properties.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, this.bootstrapServers);
        properties.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        properties.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        return properties;
    }

    private void setSecurityCredentials(final Map<String, Object> props) {
        String configPath = CONFIG_ROOT + environment + "/";
        ClassLoader classLoader = this.getClass().getClassLoader();
        LOGGER.debug("Config pat for SASL config : {}", configPath);

        File krb5ConfFile = new File(classLoader.getResource(configPath + krbConfigFileName).getFile());
        File keyTabFile = new File(classLoader.getResource(configPath + keytabFileName).getFile());
        File truststoreFile = new File(classLoader.getResource(configPath + truststoreFileName).getFile());

        props.put(SslConfigs.SSL_TRUSTSTORE_LOCATION_CONFIG, truststoreFile.getAbsolutePath());
        props.put(SslConfigs.SSL_TRUSTSTORE_PASSWORD_CONFIG, truststorePassword);

        props.put(CommonClientConfigs.SECURITY_PROTOCOL_CONFIG, SECURITY_PROTOCOL_SASL_SSL);

        props.put(SaslConfigs.SASL_MECHANISM, saslMechanism);
        props.put(SaslConfigs.SASL_KERBEROS_SERVICE_NAME, saslKerberosServiceName);
        props.put(SaslConfigs.SASL_JAAS_CONFIG, "com.sun.security.auth.module.Krb5LoginModule required doNotPrompt=true useKeyTab=true storeKey=true keyTab=\"" + keyTabFile.getAbsolutePath().replaceAll("\\\\", "/") + "\" principal=\"" + userPrincipal + "\";");
        System.setProperty("java.security.krb5.conf", krb5ConfFile.getAbsolutePath().replaceAll("\\\\", "/"));
        System.setProperty("javax.security.auth.useSubjectCredsOnly", securityAuthUseSubjectCredsOnly);
    }

    @Bean
    public ProducerFactory<String, Object> stringProducerFactory() {
        return new DefaultKafkaProducerFactory<>(producerConfigs());
    }

    @Bean
    public KafkaTemplate<String, Object> kafkaStringMessageTemplate() {
        return new KafkaTemplate<>(stringProducerFactory());
    }

    @Bean
    public BeforeTest beforeTest() {
        return new BeforeTest();
    }
}
