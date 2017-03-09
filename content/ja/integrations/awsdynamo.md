---
last_modified: 2017/03/09
translation_status: complete
language: ja
title: Datadog-AWS DynamoDB Integration
integration_title: AWS DynamoDB
kind: integration
git_integration_title: amazon_dynamodb
newhlevel: true
---

<!-- # Overview

![DynamoDB default dashboard](/static/images/dynamodb.png)

Amazon DynamoDB is a fully managed NoSQL database cloud service, part of the AWS portfolio. Fast and easily scalable, it is meant to serve applications which require very low latency, even when dealing with large amounts of data. It supports both document and key-value store models, and has properties of both a database and a distributed hash table.
 -->

# 概要

![DynamoDB default dashboard](/static/images/dynamodb.png)

Amazon DynamoDB は、完全管理の NoSQL データベース クラウドサービスです。高速かつ容易にスケールすることができ、大量のデータを処理する場合でも、非常に短いレイテンシでアプリケーションのリクエストに応答することができます。 Amazon DynamoDB は、document モデルと key-value ストア モデルの両方をサポートし、データベースと分散ハッシュテーブルの両方のプロパティを備えています。


<!-- Learn more about how to monitor DynamoDB performance metrics thanks to [our series of posts](https://www.datadoghq.com/blog/top-dynamodb-performance-metrics/). We detail the key performance metrics, how to collect them, and how [Medium](https://medium.com/) monitors DynamoDB using Datadog.
 -->

DynamoDB パフォーマンス メトリックを監視する方法については、Datadog blogで公開している[「Top DynamoDB performance metrics」](https://www.datadoghq.com/blog/top-dynamodb-performance-metrics/)を参照してください。重要なパフォーマンス メトリクス、その収集方法、および どのように [Medium 社](https://medium.com/)が Datadog を使用して DynamoDB を監視しているかを解説しています。


<!-- # Installation

This integration requires the permissions `dynamodb:list*` and `dynamodb:describe*` to be fully enabled. -->

# インストール

このインテグレーションの動作には、 `dynamodb:list*` と `dynamodb:describe*` のように全ての権限を有効にする必要があります。


<!-- # Metrics

<%= get_metrics_from_git()%>  -->

# メトリクス

<%= get_metrics_from_git()%>
