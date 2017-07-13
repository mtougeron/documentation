---
git_integration_title: consul
integration_title: Consul
kind: integration
newhlevel: true
placeholder: true
title: Datadog-Consul Integration
---

<div class='alert alert-info'><strong>NOTICE:</strong>アクセスいただきありがとうございます。こちらのページは現在英語のみのご用意となっております。引き続き日本語化の範囲を広げてまいりますので、皆様のご理解のほどよろしくお願いいたします。</div>



## Overview

Connect Consul to Datadog in order to:

* Correlate the performance of Consul with the rest of your applications
* Monitor the health of your Consul cluster

{{< insert-example-links >}}


## Metrics

{{< get-metrics-from-git >}}

For each service that you're monitoring we'll create the `consul.catalog.nodes_up` gauge metric tagged by `consul_service_id` that will let you know how many Consul nodes are running each service. We'll also collect `consul.catalog.service_u` tagged by `consul_node_id` that measures how many services a node is running.
Finally, we perform a service check `consul.check` that will report on the state of each service.

The other consul metrics collected are not service bound but node bound, and only `consul.peers` is tagged with `mode:leader` or `mode:follower`.
