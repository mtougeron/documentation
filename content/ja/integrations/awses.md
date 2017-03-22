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

Amazon Elasticsearch Service is a managed service that makes it easy to deploy, operate, and scale Elasticsearch in the AWS Cloud.

Enable this integration to see custom tags and metrics for your ES clusters in Datadog


<!-- # Installation

This integration requires the permissions `es:ListTags`, `es:ListDomainNames`  and `es:DescribeElasticsearchDomains` to be fully enabled.
 -->

# インストール

This integration requires the permissions `es:ListTags`, `es:ListDomainNames`  and `es:DescribeElasticsearchDomains` to be fully enabled.


<!-- # Metrics

<%= get_metrics_from_git() %> -->

# メトリクス

<%= get_metrics_from_git() %>