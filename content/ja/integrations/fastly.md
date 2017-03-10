---
last_modified: 2017/03/10
translation_status: complete
language: ja
title: Datadog-Fastly インテグレーション
integration_title: Fastly
kind: integration
doclevel: basic
git_integration_title: fastly
newhlevel: true
---

<!-- # Overview

![Fastly Graph](/static/images/fastlygraph.png)

Connect to Fastly to see key Fastly metrics (like cache coverage and header size) in context with the rest of your Datadog metrics. -->

# 概要

![Fastly Graph](/static/images/fastlygraph.png)

Fastly の主要メトリクス(例: キャッシュ カバレッジやヘッダー サイズ)を収集し、 Datadog で収集している他のメトリクスと連携してキャッシュやシステム全体の状態を把握できるようにする。


<!-- # Installation

No installation steps required. -->

# インストール

アプリなどのインストールは、必要ありません。


<!-- # Configuration

To enable metrics collection locate your API key on Fastly's Account Settings page, and the Service ID on the Configure page and enter them in the [Fastly integration tile](https://app.datadoghq.com/account/settings#integrations/fastly). 

Note: The ServiceID is the alphanumerical code, e.g. 5VqE6MOOy1QFJbgmCK41pY (example from https://docs.fastly.com/api/auth).

If using multiple Service IDs from one account, please enter the API key on each line. -->

# 設定

Fastly からのメトリック収集するには、 Fastly のアカウント設定ページから API キー情報を取得し、次に、設定ページからサービス ID 情報を取得します。それらの情報を、 Datadog 上のFastly [インテグレーション タイル](https://app.datadoghq.com/account/settings#integrations/fastly)に入力します。

*注:* サービス ID は、次のような英数字の文字列です。 例: 5VqE6MOOy1QFJbgmCK41pY（https://docs.fastly.com/api/auth から）

一つの Fastly アカウントで複数のサービス ID を使用している場合は、サービス ID 行ごとに API キー情報を入力してください。


<!-- # Metrics

<%= get_metrics_from_git() %> -->

# メトリクス

<%= get_metrics_from_git() %>
