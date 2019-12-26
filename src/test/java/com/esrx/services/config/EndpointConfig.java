package com.esrx.services.config;

import com.consol.citrus.dsl.endpoint.CitrusEndpoints;
import com.consol.citrus.http.client.HttpClient;
import com.consol.citrus.variable.GlobalVariables;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

@PropertySource("citrus.properties")
public class EndpointConfig {

    @Value("${persFinAct.cucumber.baseurl}")
    private String baseUrl;

    @Bean
    public GlobalVariables globalVariables() {
        GlobalVariables variables = new GlobalVariables();
        variables.getVariables().put("project.name", "Citrus Integration Tests");
        return variables;
    }

    @Bean(name = "pfaClient")
    public HttpClient testApiClient() {
        return CitrusEndpoints
                .http()
                .client()
                .requestUrl(baseUrl)
                .build();
    }

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
        return new PropertySourcesPlaceholderConfigurer();
    }
}