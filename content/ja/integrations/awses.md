---
last_modified: 2017/03/22
translation_status: complete
language: ja
title: Datadog-AWS ES インテグレーション
integration_title: AWS ES
kind: integration
doclevel: basic
newhlevel: true
git_integration_title: amazon_es
---

<!-- # Overview

Amazon Elasticsearch Service is a managed service that makes it easy to deploy, operate, and scale Elasticsearch in the AWS Cloud.

Enable this integration to see custom tags and metrics for your ES clusters in Datadog. -->

# 概要

Amazon Elasticsearch Service は、 AWS 上に Elasticsearch をデプロイし、運用し、必要に応じてスケールすることを容易にするための AWS の管理サービスです。

このインテグレーションを有効にすることで、 Elasticsearch クラスタのメトリクスとカスタム タグを Datadog 上に表示できるようになります。


<!-- # Installation

This integration requires the permissions `es:ListTags`, `es:ListDomainNames`  and `es:DescribeElasticsearchDomains` to be fully enabled.
 -->

# インストール

このインテグレーションは、 IAM 設定で `es:ListTags`, `es:ListDomainNames`, `es:DescribeElasticsearchDomains` の権限を有効にする必要があります。


<!-- # Metrics

<%= get_metrics_from_git() %> -->

# メトリクス

<%= get_metrics_from_git() %>