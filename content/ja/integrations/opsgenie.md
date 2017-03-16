---
last_modified: 2017/03/15
translation_status: complete
language: ja
title: Datadog-OpsGenie インテグレーション
integration_title: OpsGenie
kind: integration
autotocdepth: 2
newhlevel: true
---

<!-- ## Overview
{:#int-overview}

Create alerts using @opsgenie:

  * From your event stream
  * By taking a snapshot
  * When a metric alert is triggered -->

# 概要
{:#int-overview}

OpenGine インテグレーションを使用すると、 `@opengenie:` を使って Opengenie へアラートを送信できます:

  * Datadog のイベントストリームへコメントを書き込む時
  * グラフのスナップショットを撮った時 (メッセージ欄)
  * メトリクスを基にした、アラートが発生した時　(通知メッセージ欄)


<!-- ## Configuration
{:#int-configuration}

### Create a Datadog integration in OpsGenie

  1. Log in to your OpsGenie account and go to the [OpsGenie Integrations][1] page.
  2. As seen below, filter for Datadog and click on the tile.
![][2]
  3. Enter your Datadog API key from the [Integrations > APIs page][3] in the dedicated field. The key looks like this:
![][4]
  4. Choose the recipients in OpsGenie and set up your filters.
  5. Change the name of the integration if necessary.
  6. Save the configuration.
  7. Copy the red key and the name. You will use this in Datadog.
![][5]
  8. Add more DataDog integrations on OpsGenie by going to the [OpsGenie Integrations][1] page and repeating the steps above.

#### List the integration(s) you made in OpsGenie in Datadog

  1. In Datadog, select the OpsGenie tile on [Account Integrations][6].
  2. In the dialog box that pops up, click on the Configuration tab.
  3. Paste the key(s) provided for each Datadog integration (created in OpsGenie) in the **"Datadog Integration Key"** field, and enter the **"Datadog Integration Name"**.
![][7]
-->

# 設定
{:#int-configuration}

## OpsGenie 側: Datadog インテグレーションを設定する

  1. OpsGenie アカウントにログインし、 [OpsGenie Integrations][1] ページに移動します。
  2. 検索欄に Datadog と入力して、サービス インテグレーションを検索します。
![][2]
  3. Datadog サイトを [Integrations > APIs][3] と移動し、ページに表示されている API key をコピーしておきます。
![][4]
  4. OpsGenie 内での受信者を選択し、フィルタを設定します。
  5. 必要に応じての Datadog 側に表示するインテグレーションの名前を変更します。
  6. 設定を保存します。
  7. 以下に赤色で表示されている OpsGenie 側の API key とステップ 4 で決めたインテグレーション名をコピーします。
![][5]
  8. OpsGeni 上に存在する別の Datadog 向けインテグレーションを、Datadog の [OpsGenie インテグレーション][1] に追加する場合は、ステップ 2 からステップ 7 を繰り返します。

## Datadog 側: OpsGenie インテグレーション を設定する

  1. Datadog 側の [`Integrations`](https://app.datadoghq.com/account/settings)ページから、 OpsGenie のタイルを選択します。
  2. ポップアップ ページの中で、 `Configuration` タブを選択します。
  3. OpsGenie 側で作成した Datadog インテグレーション用の API key とインテグレーション名を、 **"Datadog Integration Key"** と **"Datadog Integration Name"** へ入力します。

![][7]


<!-- ## How to Use Datadog and OpsGenie Together

### Create, acknowledge and close OpsGenie alerts from Datadog

Create an OpsGenie alert by putting @opsgenie-service_name or @opsgenie in the *Say What’s Happening* field, section 5, in the Edit Metric Alert. When this alert is triggered in Datadog, an alert will be sent to the recipients in your OpsGenie service.

![](/static/images/og_metric_alert.png)

Acknowledge or close OpsGenie alerts from Datadog using @opsgenie-acknowledge or @opsgenie-close mentions in the Comments field of an OpsGenie event in Datadog.
![](/static/images/dd_ack_og_alert.png)

### Receive, acknowledge and close Datadog alerts created by OpsGenie

Set-up alerts in OpsGenie. When that alert is triggered, an event will be created in Datadog. The tags and description field from the OpsGenie alert will be carried over to Datadog.

![](/static/images/og_create_alert_dd_updated.png)

Acknowledge and close OpsGenie alerts from OpsGenie. When you do this, the associated event in Datadog will be updated with the username of the person who closed this alert.

![](/static/images/og_closed_dd_updated.png) -->

# 利用方法

## OpsGenie へアラートを送信し、そのアラートを承認, クローズする方法

Datadog 側の Monitor 設定ページの **Say What’s Happening** の部分に @opsgenie-service_name 構文や @opsgenie とメッセージ本文を書き、 OpsGenie へのアラートを作成していきます。この状態で一旦アラートがトリガーされると、 OpsGenie 側の受診者に宛てに通知が送信されます。

![](/static/images/og_metric_alert.png)

Datadog 側から OpsGenie に通知したアラートを承認やクローズするには、 Datadog のイベントストリームの OpsGenie の該当するイベントに @opsgenie-acknowledge や @opsgenie-close で始まるコメントを書き込みます。

![](/static/images/dd_ack_og_alert.png)

## OpsGenie 側からアラートを受信し、そのアラートを承認, クローズする方法

OpsGenie 側でアラート状態が発生したことをトリガーに、 Datadog 上にイベントを登録することができます。OpsGenie 側で設定したタグや詳細は、Datadog 側にも持ち越してくることができます。

![](/static/images/og_create_alert_dd_updated.png)

OpsGenie 側から受信したアラートに OpsGenie 上で承認やクローズの操作をすると、 Datadog 上の関連イベントには、 OpsGenie のアラートを処理を行った人の名前で更新が入ります。

![](/static/images/og_closed_dd_updated.png)


[1]: https://www.opsgenie.com/integration/index
[2]: /static/images/opsgenie-int-index.png
[3]: https://app.datadoghq.com/account/settings#api
[4]: /static/images/where-is-dd-key.png
[5]: /static/images/opsgenie-add-api-key.png
[6]: https://app.datadoghq.com/account/settings
[7]: /static/images/datadog-add-opsgenie-key.png

