---
last_modified: 2017/03/23
translation_status: translated
language: ja
title: Datadog-AWS Route 53 インテグレーション
integration_title: AWS Route 53
kind: integration
newhlevel: true
git_integration_title: amazon_route53
---

<!-- Amazon Route 53 is a highly available and scalable cloud Domain Name System (DNS) web service.

Enable this integration to see in Datadog all your Route 53 metrics. -->


Amazon Route 53は、高い可用性とスケール性能を持ち合わせたクラウド上のドメインネームシステム（DNS）サービスです。

DatadogにすべてのAmazon Route 53メトリクスを表示するには、このインテグレーションを有効にします。


<!-- # Overview

AWS Route 53 provides DNS and traffic management along with availability and performance monitoring via health checks. You can view the health check information in Datadog to provide context around other metrics and events in your environments. Here's an example dashboard of Route 53's health check status graph:

![](/static/images/route53_graph.png)

For information about the rest of the AWS services, see the [AWS tile][1] -->

# Overview

AWS Route 53 provides DNS and traffic management along with availability and performance monitoring via health checks. You can view the health check information in Datadog to provide context around other metrics and events in your environments. Here's an example dashboard of Route 53's health check status graph:

![](/static/images/route53_graph.png)

For information about the rest of the AWS services, see the [AWS tile][1]


<!-- # Installation

Configure Route 53 on AWS and ensure that the policy you created has the **route53:List*** action allowed. Here is an example policy to give access to Route 53 health checks.

    {
      "Statement": [
        {
          "Effect": "Allow",
          "Action": [
            "route53:List*"
          ],
          "Resource": [
            "*"
          ]
        }
      ]
    }
{:.language-json} -->

# Installation

Configure Route 53 on AWS and ensure that the policy you created has the **route53:List*** action allowed. Here is an example policy to give access to Route 53 health checks.

    {
      "Statement": [
        {
          "Effect": "Allow",
          "Action": [
            "route53:List*"
          ],
          "Resource": [
            "*"
          ]
        }
      ]
    }
{:.language-json}



<!-- # Configuration

No additional configuration is necessary after you have configured your account in the [Amazon Web Services tile][1].
 -->

# Configuration

No additional configuration is necessary after you have configured your account in the [Amazon Web Services tile][1].


<!-- # Metrics

<%= get_metrics_from_git()%> -->

# Metrics

<%= get_metrics_from_git()%>



[1]: /integrations/aws
