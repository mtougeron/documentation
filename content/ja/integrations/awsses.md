---
last_modified: 2017/04/03
translation_status: complete
language: ja
title: Datadog-AWS SES インテグレーション
integration_title: AWS SES
kind: integration
newhlevel: true
git_integration_title: amazon_ses
---

<!-- # Overview

Amazon Simple Email Service (SES) is a cost-effective, outbound-only email-sending service.

Enable this integration to see in Datadog all your SES metrics. -->

# 概要

Amazon Simple Email Service (Amazon SES) は、コスト効率に優れた 発信専用 E メールサービスです。

このインテグレーションを有効にすることで、Datadog 内で Amazon SES から収集した情報を扱うことができるようになり、インフラ環境内の他のメトリクスやイベント情報と連携して、グラフに表示したり、アラートを設定することができるようになります。


<!-- # Installation

The only requirement for this integration is the permission `ses:get`.
 -->

# インストール

Datadog 用に準備した ロールの権限に `ses:get` が、入っていることを確認します。


<!-- # Metrics

<%= get_metrics_from_git() %> -->

# メトリクス

<%= get_metrics_from_git() %>