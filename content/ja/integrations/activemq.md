---
last_modified: 2015/07/05
translation_status: complete
language: ja
title: Datadog-ActiveMQ インテグレーション
integration_title: ActiveMQ
kind: integration
doclevel: complete
newhlevel: true
git_integration_title: activemq
---

<!-- # Overview

Get metrics from ActiveMQ in real time to

* Visualize your web ActiveMQ server performance
* Correlate the performance of ActiveMQ with the rest of your applications
-->

# 概要

ActiveMQy より、リアルタイムでメトリクスを取得します。

* ActiveMQ サーバーのパフォーマンスを可視化します。
* ActiveMQ のパフォーマンスメトリクスを他のアプリケーション情報と関連付けられるようにします。


<!-- # Configuration
{: #int-configuration}

***This integration requires Linux or Mac OS X.***

*To capture ActiveMQ metrics you need to install the Datadog agent. Metrics will be captured using a JMX connection. **We recommend the use of Oracle's JDK for this integration.***
-->


# 設定
{: #int-configuration}
**このインテグレーションでメトリクスを取得するには、 Linux もしくは Mac OS X 上で ActiveMQ が動作している必要があります。**

ActiveMQ のメトリクスを取得するには、 Datadog Agent をインストールする必要があります。
メトリクスは、 JMX のコネクションを介して取得されます。**このインテグレーションには、 Oracleの JDK を推奨します。**

<!--
1. **Make sure that [ JMX Remote is enabled][1] on your ActiveMQ server.**
2. Configure the agent to connect to ActiveMQ. Edit `${confd_help('`conf.d/activemq.yaml`')}`

        instances:
          - host: localhost
            port: 7199
            user: username
            password: password
            name: activemq_instance
        # List of metrics to be collected by the integration
        # You should not have to modify this.
        init_config:
          conf:
            - include:
              Type: Queue
              attribute:
                AverageEnqueueTime:
                  alias: activemq.queue.avg_enqueue_time
                  metric_type: gauge
                ConsumerCount:
                  alias: activemq.queue.consumer_count
                  metric_type: gauge
                ProducerCount:
                  alias: activemq.queue.producer_count
                  metric_type: gauge
                MaxEnqueueTime:
                  alias: activemq.queue.max_enqueue_time
                  metric_type: gauge
                MinEnqueueTime:
                  alias: activemq.queue.min_enqueue_time
                  metric_type: gauge
                MemoryPercentUsage:
                  alias: activemq.queue.memory_pct
                  metric_type: gauge
                QueueSize:
                  alias: activemq.queue.size
                  metric_type: gauge
                DequeueCount:
                  alias: activemq.queue.dequeue_count
                  metric_type: counter
                DispatchCount:
                  alias: activemq.queue.dispatch_count
                  metric_type: counter
                EnqueueCount:
                  alias: activemq.queue.enqueue_count
                  metric_type: counter
                ExpiredCount:
                  alias: activemq.queue.expired_count
                  type: counter
                InFlightCount:
                  alias: activemq.queue.in_flight_count
                  metric_type: counter

            - include:
              Type: Broker
              attribute:
                StorePercentUsage:
                  alias: activemq.broker.store_pct
                  metric_type: gauge
                TempPercentUsage:
                  alias: activemq.broker.temp_pct
                  metric_type: gauge
                MemoryPercentUsage:
                  alias: activemq.broker.memory_pct
                  metric_type: gauge
    {:.language-yaml}

3. Restart the agent

        sudo /etc/init.d/datadog-agent restart
    {:.language-shell}

        if [ $(sudo supervisorctl status | egrep "datadog-agent.*RUNNING" | wc -l) == 3 ]; \
        then echo -e "\e[0;32mAgent is running\e[0m"; \
        else echo -e "\e[031mAgent is not running\e[0m"; fi
    {:.language-shell}

<%= insert_example_links(check: "none")%>
-->

1. **ActiveMQ サーバー上で [JMX Remote][1] が有効になっていることを確認してください。**
2. ActiveMQ に接続出来るように、Agent を設定します。
`${confd_help('<code>conf.d/activemq.yaml</code>')}` を次のように編集します。

        instances:
            -   host: localhost
                port: 7199
                user: username
                password: password
                name: activemq_instance
        # List of metrics to be collected by the integration
        # You should not have to modify this.
        init_config:
             conf:
               - include:
                   Type: Queue
                   attribute:
                     AverageEnqueueTime:
                       alias: activemq.queue.avg_enqueue_time
                       metric_type: gauge
                     ConsumerCount:
                       alias: activemq.queue.consumer_count
                       metric_type: gauge
                     ProducerCount:
                       alias: activemq.queue.producer_count
                       metric_type: gauge
                     MaxEnqueueTime:
                       alias: activemq.queue.max_enqueue_time
                       metric_type: gauge
                     MinEnqueueTime:
                       alias: activemq.queue.min_enqueue_time
                       metric_type: gauge
                     MemoryPercentUsage:
                       alias: activemq.queue.memory_pct
                       metric_type: gauge
                     QueueSize:
                       alias: activemq.queue.size
                       metric_type: gauge
                     DequeueCount:
                       alias: activemq.queue.dequeue_count
                       metric_type: counter
                     DispatchCount:
                       alias: activemq.queue.dispatch_count
                       metric_type: counter
                     EnqueueCount:
                       alias: activemq.queue.enqueue_count
                       metric_type: counter
                     ExpiredCount:
                       alias: activemq.queue.expired_count
                       type: counter
                     InFlightCount:
                       alias: activemq.queue.in_flight_count
                       metric_type: counter

               - include:
                   Type: Broker
                   attribute:
                     StorePercentUsage:
                       alias: activemq.broker.store_pct
                       metric_type: gauge
                     TempPercentUsage:
                       alias: activemq.broker.temp_pct
                       metric_type: gauge
                     MemoryPercentUsage:
                       alias: activemq.broker.memory_pct
                       metric_type: gauge

3. Datadog Agentの再起動

        sudo /etc/init.d/datadog-agent restart
    {:.language-shell}

    *確認が必要な場合*

        if [ $(sudo supervisorctl status | egrep "datadog-agent.*RUNNING" | wc -l) == 3 ]; \
        then echo -e "\e[0;32mAgent is running\e[0m"; \
        else echo -e "\e[031mAgent is not running\e[0m"; fi
    {:.language-shell}

<%= insert_example_links(check: "none")%>


<!-- # Metrics

<%= get_metrics_from_git()%> -->

# メトリクス

<%= get_metrics_from_git()%>


[1]: http://activemq.apache.org/jmx.html