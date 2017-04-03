---
last_modified: 2017/04/03
translation_status: compete
language: ja
title: Datadog-AWS S3 インテグレーション
integration_title: AWS S3
kind: integration
doclevel: basic
newhlevel: true
git_integration_title: amazon_s3
---

<!-- # Overview

![S3 Dashboard](/static/images/s3_db_screenshot.png)

Amazon Simple Storage Service (S3) is a highly available and scalable cloud storage service.

Enable this integration to see in Datadog all your S3 metrics. -->

# 概要

Amazon Simple Storage Service（S3）は、高可用性でスケーラブルなクラウド ストレージ サービスです。

このインテグレーションを有効にすることで、Datadog 内で Amazon S3 から収集した情報を扱うことができるようになり、インフラ環境内の他のメトリクスやイベント情報と連携して、グラフに表示したり、アラートを設定することができるようになります。


![S3 Dashboard](/static/images/s3_db_screenshot.png)

<!-- # Installation

* **Daily Storage Metrics**

	The only requirement to monitor daily metrics is the permission `s3:GetBucketTagging`.

* **Request Metrics**

	[Enable Requests metrics][1] on your Amazon S3 buckets from the AWS console. -->

# インストール

* **ストレージ メトリクス**

    Datadog 用に準備した ロールの権限に `s3:GetBucketTagging` が、入っていることを確認します。

* **リクエスト メトリクス**

    AWS コンソール上で Amazon S3 の各バケットへの[”Requests metrics”][1]を有効にします。


<!-- # Metrics

<%= get_metrics_from_git() %> -->

# メトリクス

<%= get_metrics_from_git() %>


[1]: http://docs.aws.amazon.com/AmazonS3/latest/dev/cloudwatch-monitoring.html