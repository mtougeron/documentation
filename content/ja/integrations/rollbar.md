---
last_modified: 2017/04/10
translation_status: complete
language: ja
title: Datadog-Rollbar インテグレーション
integration_title: Rollbar
kind: integration
newhlevel: true
doclevel: basic
---

<!-- ### Overview

Rollbar helps developers like us build better software, faster. With Rollbar developers can view exceptions from all of of their frameworks, platforms and environments in one place.

With this integration Rollbar users can:

- Syndicate exceptions, errors and code deployments as 'Events' in Datadog. -->

# 概要

Rollbar は、開発者がより良いソフトウェアをより早く構築することを支援するサービスです。Rollbar を使用すると、フレームワーク、プラットフォーム、運用環境で発生しているすべての例外情報を一カ所で閲覧することができるようになります。

Datadog と Rollbar 連携することにより、次のことが可能になります:

* Rollbarが検知した例外, エラー, コード デプロイメントのタイミングを Datadog 上で"イベント"として取り扱う。


<!-- ### Installation

No installation is required. -->

# インストール

Datadog Agent などのミドルウェアのインストールは必要ありません。


<!-- ### Configuration

To integrate Rollbar with Datadog:

1. Retrieve an API key from Datadog's [API settings page](https://app.datadoghq.com/account/settings#api)
1. Login to [Rollbar](http://www.rollbar.com), and go to the Notification settings page for a project: Dashboard → Settings → Notifications
1. Enter your Datadog API key.
1. Click Enable Datadog Integration
1. (optional) Customize your notification settings to taste! -->

# 設定

Rollbar を Datadog と連携するには：

1. Datadog の[API 設定ページ][1]から API キーを取得する。
1. [Rollbar][2] にログインし、プロジェクトの通知を設定するページに移動する。（Dashboard → Settings → Notifications）
1. Datadog のAPI キーを入力する。
1. "Enable Datadog Integration" をクリックする。
1. 必要に応じて通知の設定をカスタマイズする。


<!-- ### Metrics

This integration does not include metrics at this time. -->

# メトリクス

このインテグレーションは、メトリクスを集取していません。


<!-- ### Events

This integration will push exceptions, errors and code deployments into Datadog as events.
 -->

# イベント

このインテグレーションは、rollbar側で集取した例外, エラー, コード デプロイメントのタイミングを、 Datadog のイベントして送信します。

[1]: https://app.datadoghq.com/account/settings#api
[2]: http://www.rollbar.com