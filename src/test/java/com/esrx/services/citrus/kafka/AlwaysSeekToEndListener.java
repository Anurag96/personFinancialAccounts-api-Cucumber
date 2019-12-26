package com.esrx.services.citrus.kafka;

import org.apache.kafka.clients.consumer.Consumer;
import org.apache.kafka.clients.consumer.ConsumerRebalanceListener;
import org.apache.kafka.common.TopicPartition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collection;

public class AlwaysSeekToEndListener<K, V> implements ConsumerRebalanceListener {

    private static Logger log = LoggerFactory.getLogger(AlwaysSeekToEndListener.class);

    private Consumer<K, V> consumer;
    private String topic;

    public AlwaysSeekToEndListener(Consumer consumer, String topic) {
        this.consumer = consumer;
        this.topic = topic;
    }

    @Override
    public void onPartitionsRevoked(Collection<TopicPartition> partitions) {
        System.out.println("partitions = " + partitions);
    }

    @Override
    public void onPartitionsAssigned(Collection<TopicPartition> partitions) {
        consumer.seekToEnd(partitions);
        for (TopicPartition topicPartion : partitions) {
            log.debug("AlwaysSeekToEndListener partition " + topicPartion.partition() + ", position "
                    + consumer.position(new TopicPartition(topic, topicPartion.partition())));
        }

    }
}