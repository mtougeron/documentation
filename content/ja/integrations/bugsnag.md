---
last_modified: 2015/07/05
translation_status: complete
language: ja
title: Datadog-Bugsnag インテグレーション
integration_title: Bugsnag
kind: integration
doclevel: basic
newhlevel: true
---

<!-- # Overview

Bugsnag provides software teams with an automated crash detection platform for their web and mobile applications. Bugsnag automatically captures and alerts you of errors as they happen. Integrating Datadog with Bugsnag will send error notifications to your Datadog event stream.

With this integration:

- Get a summary of the error in your Datadog event stream
- Get notified when a project has a spike in error rates
- Filter notifications by severity and release stage -->

# 概要

Bugsnag は、Web site や、モバイル アプリケーション向に、クラッシュを自動で検出するプラットフォームを提供します。Bugsnag は、エラー発生時に自動で状況をキャプチャし、アラートを通知してくれいます。

Bugsnag と Datadog を連携することで、 Datadog のイベント ストリームに Bugsnag が検出したエラーが通知/表示される様になります。

このインテグレーションでを有効にすると:

- エラーの概要を取得し、Datadog のイベントスト リームに表示する
- プロジェクトのエラー率が急上昇した際に通知を受ける
- エラーの重要度や、リリース段階の情報に基づいて通知をフィルタする

<!-- # Installation

No installation is required. -->

# インストール

Aagent などのインストールはありません。


<!-- # Configuration

To integrate Bugsnag with Datadog:

1. In [Bugsnag](https://bugsnag.com/) go to _Settings_ for the project you would like to configure to send notifications to Datadog
1. Select _Team Notifications_ and then _Datadog_
1. Customize the notifications you'll see in Datadog by selecting error notification triggers.
1. Apply custom filters to your notification triggers to see errors from specific release stages and severities.
1. Enter your Datadog API key.
1. Select _Test Notification_ to test the configuration. A test error from Bugsnag will appear in Datadog's event stream.
1. _Save_ your settings.
1. Add more streams from the same project to see error events based on a different set of notification criteria. -->

# 設定

Bugsnag と Datadog を連携するには:

1. [Bugsnag](https://bugsnag.com/) で 監視したいプロジェクトを選択し、そのプロジェクトページの左上のある *Settings* タブをクリックします。
2. *Configure integrations* をクリックし、Datadog を選択します。
3. ポップアップで、Datadog の API キーを入力します。
4. "Notify me when..." のポップアップで、通知トリガ項目を選択し、 Datadog に表示する項目をカスタマイズします。
5. "Filter by severity" と "Filter by stage" をクリックしてカスタムフィルタを適用し、特定の重要度とリリース段階からのエラーに絞り込みます。
6. "Add another integration" をクリックし、同じプロジェクトに複数のストリームを追加し、異なる通知基準に基づいてエラー イベントを Datadog へ送信するようにします。


<!-- # Metrics

This integration does not include metrics at this time. -->

# メトリクス

このインテグレーションには、メトリクスはありません。


<!-- # Events

This integration will push configured Bugsnag errors and alerts to your Datadog event stream. -->

# イベント

このインテグレーションを有効にすると、 Bugsnag で検知したエラーとアラートを Datadog のイベント ストリームに表示できるようになります。
