---
last_modified: 2017/03/09
translation_status: complete
language: ja
title: Datadog-AWS EC2 インテグレーション
integration_title: AWS EC2
kind: integration
git_integration_title: amazon_ec2
newhlevel: true
---

<!-- # Overview

Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers.

Enable this integration to see in Datadog all your EC2 metrics, and additional events like scheduled maintenances. -->

# 概要

Amazon Elastic Compute Cloud（Amazon EC2）は、クラウド上でサイズ変更可能な計算能力を提供するWebサービスです。 ウェブスを使ってケールするタイプのクラウド コンピューティングを、開発者が容易にできるように設計されています。

このインテグレーションを有効にすると、 Datadog 内で EC2 のすべてのメトリクスと提起保守などの追加イベントが表示されるようになります。


<!-- # Installation

If you haven't already, set up the [Amazon Web Services integration first](/integrations/aws). There are no other installation steps that need to be performed. -->

# インストール

まだインストールしていない場合は、[Amazon Web Services integration first](/ja/integration/aws)を設定します。 これ以外の、インストール作業は必要ありません。


<!-- # Configuration

In the Amazon Web Services integration tile, ensure that EC2 is checked under metric collection. -->

# 設定

Amazon Web Services　のタイルの　"Limit metric collection"　項目で、EC2　にチェック マークがあることを確認します。


<!-- # Metrics

<%= get_metrics_from_git()%>

Each of the metrics retrieved from AWS will be assigned the same tags that appear in the AWS console, including but not limited to host name, security-groups, and more.
 -->

# メトリクス

<%= get_metrics_from_git()%>

AWS から取得した各メトリックには、 AWS コンソールに表示されているタグと同じタグ（ ホスト名, セキュリティグループ, その他 )も付与されます。



