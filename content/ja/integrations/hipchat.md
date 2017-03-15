---
last_modified: 2017/03/15
translation_status: complete
language: ja
title: Datadog-HipChat インテグレーション
integration_title: HipChat
kind: integration
newhlevel: true
git_integration_title: hipchat
---

<!-- # Overview

Connect HipChat to Datadog in order to:

- Receive notifications when someone posts on your stream.
- Receive metric alerts and see graphs within Hipchat. -->

# 概要

次の目的で、HipchatとDatadogを連携します:

* Datadog上でチームメンバーがコメントをポストした場合、その内容をHipChatにも送信します。
* Datadog上で設定したアラートの通知先をHipChatにした場合、アラート通知とグラフをHipChatに送信します。
* Datadog上でチームメンバーがグラフをキャプチャした場合、グラフを送信します。


<!-- # Installation

No installation steps are required for this integration -->

# インストール

このインテグレーションは、ソフトウェアのインストールを必要としません。


<!-- # Configuration

1. [Create a new access token](https://www.hipchat.com/admin/api) for Datadog. Only notification level acccess is required.
1. Copy your key and enter it in the [HipChat integration tile](https://app.datadoghq.com/account/settings#integrations/hipchat).
1. Enter the room names you wish to allow access to from Datadog.
Tick the checkbox if you want to be notified for every comment, in all configured rooms. If the checkbox is left unchecked, you will need to use the @hipchat-chat_name syntax.
1. Save your configuration

You can now share graphs or send alerts to HipChat rooms using the syntax @hipchat-chat_name -->


# 設定

1. 新たに Datadog 用の [access token](https://www.hipchat.com/admin/api) を作成します。その際、アクセス権で必要な権限は、通知レベルまでです。
2. キーをコピーし、[HipChat インテグレーション](https://app.datadoghq.com/account/settings#integrations/hipchat) タイルに入力します。
3. Datadog からのアクセスを許可するチャット ルーム名を入力します。
Datadog 上で発生した全コメントの通知を受けたい場合は、チャット ルーム名の横のチェック ボックスをオンにします。チェック ボックスがオフの場合は、@hipchat-c​​hat_name 構文を使った場合のみ、メッセージを送信することになります。
4. 設定を保存します。

これらの設定により、 @hipchat-chat_name 構文を使用して、HipChat のチャット ルーム上でグラフを共有したり、アラートを送信することができます。

注: チャット ルーム名にカンマや角括弧などの特殊文字が含まれている場合は、@hipchat-chat_name 構文で通知を送信する際にエスケープされます。


<!-- # Metrics

This integration does not provide metrics. -->

# メトリクス

このインテグレーションは、メトリクスを収集していません。