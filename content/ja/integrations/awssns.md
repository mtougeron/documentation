---
last_modified: 2017/04/03
translation_status: complete
language: ja
title: Datadog-AWS SNS インテグレーション
integration_title: AWS SNS
kind: integration
newhlevel: true
git_integration_title: amazon_sns
---

<!-- # Overview

![SNS Dashboard](/static/images/snsdashboard.png)

Connect SNS to Datadog in order to:

* See SNS messages as events in your stream
* Send alert and event notifications to SNS -->

# 概要

Amazon Simple Notification Service (Amazon SNS) は、高速かつ柔軟な完全マネージド型のプッシュ通知サービスです。

このインテグレーションを有効にすることで、Datadog 内で Amazon SNS から収集したイベント情報を扱うことができるようになり、インフラ環境内の他のメトリクスやイベント情報と連携して、グラフに表示したり、アラートを設定することができるようになります。

![SNS Dashboard](/static/images/snsdashboard.png)


<!-- # Installation

## Receiving SNS Messages In the Event Stream

1.  On the Topics section of the SNS Management console, select the desired topic and click Create Subscription
1.  Select https and enter the following webhook url:

        https://app.datadoghq.com/intake/webhook/sns?api_key=<API KEY> -->

# インストール

## Amazon SNS からのメッセージをイベント ストリームに表示します

1. SNS の管理コンソールの Topics セクションで目的のトピックを選択し、 "Subscribe to topic" を "Actions" のメニューから選択します。
2. https を選択して次の webhook url を設定します:

        https://app.datadoghq.com/intake/webhook/sns?api_key=<API KEY>


<!-- # Configuration

## Sending SNS Notifications from Datadog

1.  Configure the AWS account that is associated with an SNS service on the AWS integration tile
2.  Install the SNS integration
3.  Datadog will detect your configured SNS topics and demonstrate the @ notifications you can use below (e.g., "@sns-topic-name") -->

# 設定

## Datadog から Amazon SNS へ通知を送信します

1. Amazon Web Service インテグレーションのタイルで Amazon SNS サービスに関連付けられている AWS アカウントを設定します。
2. Amazon SNS インテグレーションをインストールします。
3. Datadog 側で、 Webhook の設定された SNS トピックを検出し、通知が可能な状態にします。検出ができると、 @notification を使って通知を送ることができるようになります。


<!-- # Metrics

<%= get_metrics_from_git()%>
 -->

# メトリクス

<%= get_metrics_from_git()%>
