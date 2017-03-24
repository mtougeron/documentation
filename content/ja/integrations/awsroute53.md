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

<!-- # Overview

AWS Route 53 provides DNS and traffic management along with availability and performance monitoring via health checks. You can view the health check information in Datadog to provide context around other metrics and events in your environments. Here's an example dashboard of Route 53's health check status graph:

![](/static/images/route53_graph.png)

For information about the rest of the AWS services, see the [AWS tile][1] -->

# 概要

AWS Route 53 は、 DNS とトラフィック管理を提供します。又、ヘルスチェックを設定することにより、可用性の確保とパフォーマンスの監視も可能にします。Datadog に AWS Route 53 のヘルスチェック情報を表示すると、環境内の他のメトリクスやイベントとそのヘルスチェックの情報を相関して状況を把握できるようになります。以下は、Route 53 のヘルスチェック ステータス グラフのダッシュボード例です:

![](/static/images/route53_graph.png)

他の AWS サービスに関する詳細に関しは、["Datadog-AWS インテグレション"][j1] を参照してください。


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

# インストール

AWS の Route 53 を設定し、作成したポリシに **route53:List** アクションが許可されていることを確認します。 以下に、Route 53　ヘルス チェックにアクセスするためのポリシ例を示します。

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

# 設定

[Amazon Web Services タイル][2] を設定した後、追加の設定は必要ありません。


<!-- # Metrics

<%= get_metrics_from_git()%> -->

# メトリクス

<%= get_metrics_from_git()%>



[1]: /integrations/aws
[2]: https://app.datadoghq.com/account/settings#integrations/amazon_web_services
[j1]: /ja/integrations/aws
