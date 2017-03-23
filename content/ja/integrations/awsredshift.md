---
last_modified: 2017/07/23
translation_status: translated
language: ja
title: Datadog-AWS Redshift インテグレーション
integration_title: AWS Redshift
kind: integration
git_integration_title: amazon_redshift
newhlevel: true
doclevel: basic
---

<!-- # Overview

Amazon Redshift is a fast, fully managed, petabyte-scale data warehouse service that makes it simple and cost-effective to efficiently analyze all your data.

Enable this integration to see all your Redshift metrics in Datadog.
 -->

# 概要

Amazon Redshift は、高速かつ完全に管理されたペタ バイト規模のデータ ウェアハウス サービスです。
データを効率的に分析するためのシンプルで費用対効果の高いサービスです。このサービスを使うと、すべてのデータをシンプルかつコスト効果の高い方法で分析できます。

このインテグレーションを有効にすると、Datadog 上に Redshift のメトリクスが表示されるようになります。


<!-- # Configuration

If you haven't already, set up the [Amazon Web Services integration](/integrations/aws) first. In [the Amazon Web Services integration tile](https://app.datadoghq.com/account/settings#integrations/amazon_web_services), ensure that Redshift is checked under "Limit metric collection". -->

# 設定

[Amazon Web Services インテグレーション][j1]を未だ設定ていない場合は、まずはそれを設定します。次に [Amazon Web Services][2] インテグレーション のタイルの左側カラムの "Limit metric collection" で、 Redshift にマークがあることを確認します。

[j1]: /ja/integrations/aws
[2]: https://app.datadoghq.com/account/settings#integrations/amazon_web_services

<!-- # Metrics

<%= get_metrics_from_git()%>

Each of the metrics retrieved from AWS will be assigned the same tags that appear in the AWS console, including but not limited to host name, security-groups, and more.
 -->

# メトリクス

<%= get_metrics_from_git()%>

AWS から集取したメトリクスには、 AWS コンソールにされているものと同じタグが割り当てられています。
(例: ホスト名、 セキュリティグループ、 その他)


