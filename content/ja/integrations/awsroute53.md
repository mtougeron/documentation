---
last_modified: 2017/04/03
translation_status: complete
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

AWS Route 53 は、 DNS と可用性を持ったネットワーク トラフィック の管理サービスです。又、AWS Route 53 は、ヘルス チェックによるパフォーマンスの監視機能も提供します。Datadog でこのヘルス チェックの情報を取り扱うことにより、インフラ環境内の他のメトリクスやイベントと連携してグラフを表示したり、アラートを設定することができるようになります。以下は、Route 53 のヘルス チェック ステータス グラフのダッシュボードのサンプルです:


![](/static/images/route53_graph.png)

他の AWS サービスの情報については、 [AWS タイル][1]を参照してください。


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

AWS 上で Route 53 を設定し、 Datadog 用に準備したポリシに **route53:List** アクションの実行権限があることを確認します。 以下は、 Route 53 のヘルスチェックにアクセスするためのポリシの例です。


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

No additional configuration is necessary after you have configured your account in the [Amazon Web Services tile][1]. -->

# 設定

[Amazon Web Service のタイル][1]でアカウント情報を設定した後は、追加の設定は必要ありません。


<!-- #Metrics

<%= get_metrics_from_git()%> -->

# メトリクス

<%= get_metrics_from_git()%>


[1]: /integrations/aws
