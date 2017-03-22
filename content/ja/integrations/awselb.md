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

Elastic Load Balancing (ELB) は、アプリケーションから受信している Web トラフィックを、異なるアベイラビリティ ゾーンの複数の Amazon EC2 バックエンドインスタンスに送信して処理させるための AWS サービスです。ELBは、スムーズなユーザ エクスペリエンスを確保し、耐障害性を高めます。又、トラフィックの急激な増加への対処や障害が発生した EC2 インスタンスの対処を、サービスの中断を発生させずに処理できるようにします。

ELB メトリクスの収集するには、この[リンク先の手順][1]に従って AWS CloudWatch とのインテグレーションを設定するだけです。

ELB のパフォーマンス メトリクスの監視方法の詳細に関しては、["Top ELB health and performance metrics"][2] とそのシリーズ のブログ記事を参照してください。


<!-- # Configuration

1.  Enable the [Amazon Web Services integration](/integrations/aws).
1.  Open the [AWS integration tile](https://app.datadoghq.com/account/settings#integrations/amazon_web_services) and ensure the **ELB checkbox** on the left is checked. -->

# 設定

1. 先ず、[Amazon Web Services][j3] のインテグレーションを有効にします。
2. [Amazon Web Services インテグレーション タイル][4]の、左側のコラムで ELB チェック ボックスにマークが付いていることを確認します。


<!-- # Metrics

<%= get_metrics_from_git()%> -->

# メトリクス

<%= get_metrics_from_git()%>



  [1]: http://docs.datadoghq.com/integrations/aws/
  [2]: https://www.datadoghq.com/blog/top-elb-health-and-performance-metrics/
  [j3]: /ja/integrations/aws
  [4]: https://app.datadoghq.com/account/settings#integrations/amazon_web_services