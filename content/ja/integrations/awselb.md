---
last_modified: 2017/03/33
translation_status: complete
language: ja
title: Datadog-AWS ELB インテグレーション
integration_title: AWS ELB
kind: integration
git_integration_title: amazon_elb
updated_for_agent: 5.8.5
newhlevel: true
---

<!-- # Overview

![ELB default dashboard](/static/images/elb.png)

Elastic Load Balancing (ELB) is an AWS service used to dispatch incoming web traffic from your applications across your Amazon EC2 backend instances, which may be in different availability zones. ELB helps ensure a smooth user experience and provide increased fault tolerance, handling traffic peaks and failed EC2 instances without interruption.

To start collecting ELB metrics, the only thing you need to do is to set up our integration with AWS CloudWatch by following [these instructions](http://docs.datadoghq.com/integrations/aws/).

Learn more about how to monitor ELB performance metrics thanks to [our series of posts](https://www.datadoghq.com/blog/top-elb-health-and-performance-metrics/). We detail the key performance metrics, how to collect them, and how to use Datadog to monitor ELB. -->

# 概要

![ELB default dashboard](/static/images/elb.png)

Elastic Load Balancing (ELB) is an AWS service used to dispatch incoming web traffic from your applications across your Amazon EC2 backend instances, which may be in different availability zones. ELB helps ensure a smooth user experience and provide increased fault tolerance, handling traffic peaks and failed EC2 instances without interruption.

To start collecting ELB metrics, the only thing you need to do is to set up our integration with AWS CloudWatch by following [these instructions](http://docs.datadoghq.com/integrations/aws/).

Learn more about how to monitor ELB performance metrics thanks to [our series of posts](https://www.datadoghq.com/blog/top-elb-health-and-performance-metrics/). We detail the key performance metrics, how to collect them, and how to use Datadog to monitor ELB.

Elastic Load Balancing（ELB）は、Amazon EC2バックエンドインスタンス間でアプリケーションからの着信Webトラフィックをディスパッチするために使用されるAWSサービスで、異なる可用性ゾーンにある可能性があります。  ELBは、スムーズなユーザーエクスペリエンスを確保し、耐障害性を高め、トラフィックのピークと障害の発生したEC2インスタンスを中断することなく処理します。

ELBメトリックの収集を開始するには、これらの手順に従ってAWS CloudWatchとの統合をセットアップするだけです。

一連の投稿のおかげで、ELBのパフォーマンス指標を監視する方法の詳細をご覧ください。 主要なパフォーマンスメトリック、収集方法、およびDatadogを使用してELBを監視する方法について詳しく説明します。


<!-- # Configuration

1.  Enable the [Amazon Web Services integration](/integrations/aws).
1.  Open the [AWS integration tile](https://app.datadoghq.com/account/settings#integrations/amazon_web_services) and ensure the **ELB checkbox** on the left is checked. -->

# 設定

1.  Enable the [Amazon Web Services integration](/integrations/aws).
1.  Open the [AWS integration tile](https://app.datadoghq.com/account/settings#integrations/amazon_web_services) and ensure the **ELB checkbox** on the left is checked.

1. Amazon Web Servicesの統合を有効にします。
2. AWS統合タイルを開き、左側のELBチェックボックスがオンになっていることを確認します。


<!-- # Metrics

<%= get_metrics_from_git()%> -->

# メトリクス

<%= get_metrics_from_git()%>