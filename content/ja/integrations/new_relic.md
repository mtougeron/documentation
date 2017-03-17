---
last_modified: 2015/07/16
translation_status: complete
language: ja
title: Datadog-New Relic インテグレーション
integration_title: New Relic
kind: integration
git_integration_title: new_relic
newhlevel: true
---

<!-- # Overview

![New Relic Dashboard](/static/images/newrelicdashboard.png)

Connect to New Relic to:

* See key New Relic metrics (like response time and Apdex score) in context with the rest of your Datadog metrics
* See New Relic alerts in your event stream -->

# 概要

![New Relic Dashboard](/static/images/newrelicdashboard.png)

次の目的の為に、New RelicのメトリクスをDatadogに送信します:

* New Relic キーメトリクス(レスポンス時間、Apdexスコアなど)をDatadogで取得したメトリクスと連携
* New Relic が検知したアラートをDatadogのイベントストリームにも表示


<!-- # Installation

## New Relic Alerts in Event Stream

1.  On the Webhook tab of New Relic's alerting notification settings page, enter the following webhook URL:

        https://app.datadoghq.com/intake/webhook/newrelic?api_key={YOUR_DATADOG_API_KEY}

1.  For 'Custom Payload'(s), select JSON 'Payload Type'.

## New Relic APM Metric Collection

1.  Locate your API key on New Relic's API Keys page (**Account Settings** -> **Integrations** -> **API Keys**) and enter it in the form on the [Datadog New Relic Integration](https://app.datadoghq.com/account/settings#integrations/new_relic) page.

    *Note: Metrics can only be imported for New Relic customers at the Pro level or above.*

1.  If you wish to tag metrics at an account level, please add an account tag.
1.  Choose whether you want to collect your metrics per hosts or app-wide.

    *Note: Enabling this options will import New Relic hosts to Datadog.* -->

# インストール

## New Relic Alert をイベントストリームの表示

1. New Relic のアラート通知の設定ページで、Webhooks タブを選択し、以下の Webhooks URL を入力します:


        https://app.datadoghq.com/intake/webhook/newrelic?api_key={YOUR_DATADOG_API_KEY}

2. カスタム ペイロードを送信する場合は、 'Payload Type' で JSON を選択してください。

## New Relic APM メトリクスの集取

1. New Relic の API Key ページで API キーを特定します。(**Account Settings** -> **Integrations** -> **API Keys**)このキーを、Datadog サイトの [New Relic インテグレーション][1] タイルを表示して入力します。

    *注: New Relic APM のメトリクスは、 Pro レベル以上 顧客ステータスが必要です。*

2. アカウント レベルでメトリクスにタグを付けたい場合は、アカウント タグを追加してください。

3. ホスト単位でメトリクスを収集するか、アプリ全体のメトリクスを収集するかを選択します。

    *注: このオプションを有効にすると、 New Relic hosts が Datadog にインポートされます。*


[1]: https://app.datadoghq.com/account/settings#integrations/new_relic

<!-- # Metrics

<%= get_metrics_from_git() %> -->

# メトリクス

<%= get_metrics_from_git() %>



<!-- #### What does the 'Collect metrics by host' option do ?

When set, Datadog collects application metrics for every associated hosts,
instead of the overall host throughput based average.

This makes sense when using those metrics separately, i.e.
"host X has aberrant error rate Y which is problematic, though application Z overall
across many hosts has an acceptable error rate in aggregate".

This also import New Relic hosts to Datadog Infrastructure section. -->


# トラブルシューティング

**'Collect metrics by host' オプションの効能**

このオプションを設定する事により、Datadog側では関連付けられた全てのホストのアプリケーションメトリクスを取得するようになります。(オプションを設定していない状態では、下記に示す"overall host throughput based average"になります。)

メトリクスを個別に扱おうとしている場合は、この方法が理にかなっています。例えば、ホストXが問題となるようなエラー率値Yになっているにも関わらず、各ホストに分散するアプリケーションZの集約したエラー率は、容認範囲に収まっている場合がその例です。


<!-- #### I have the 'Collect metrics by host' option enable. Why do my application-level metrics have different values in New Relic and Datadog?

When New Relic computes the aggregate application-level value for
metrics that are measured at the host level (e.g. response time), they
compute a weighted average based on each host's measured throughput.

The closest thing you'll see in Datadog is the `avg` aggregator, which
computes the arithmetic mean of the values. This is also the default
aggregator, and what you'll get for the simplest query, something like
`new_relic.web_transaction.average_response_time{*}`. If your hosts all
have approximately the same throughput, our average aggregation and NR's
throughput-weighted aggregation will yield similar numbers, but if
thoughput is not balanced, you will see different aggregate
application-level values in NR and Datadog.

For example, say you have an application with three hosts. At a
specific point in time, the hosts have the following values:

               throughput    response time
    hostA         305 rpm           240 ms
    hostB         310 rpm           250 ms
    hostC          30 rpm            50 ms

New Relic would compute the application-level response time as follows:

    hostA: 240 ms * 305 rpm = 73200 total time
    hostB: 250 ms * 310 rpm = 77500 total time
    hostC:  50 ms *  30 rpm =  1500 total time

    total throughput = 305 + 310 + 30 = 645 rpm
    average response time = (73200 + 77500 + 1500) / 645 = 236.0 ms

Whereas we would simply compute the arithmetic mean:

    average response time = (240 + 250 + 50) / 3 = 180.0 ms -->

**'Collect metrics by host' オプションを有効にしています。なぜapplication-levelのメトリクスの示す値がNew RelicとDatadogで違っているのですか。**

New Relicが、ホストレベルで測定されたメトリクス(例えば、レスポンス時間)のapplication-levelの集計値を計算する際、各ホストで測定されたスループットに基づいて加重平均を計算します。

Datadogで最も類似した集計処理が `avg` になりますが、この処理は値の単純平均を計算しています。この処理は、デフォルトの集計処理で、`new_relic.web_transaction.average_response_time{*}` ようなシンプルな集計処理でよく使われます。
もしも全てのホストがほぼ同じスループットで動作しているなら、Datadogの平均も、Nwe Relicのスループット加重の集計も似たような値を算出するでしょう。しかし、スループットがそれほど均一でない場合は、application-levelの集計値に無視できないほど開きがでるでしょう。

例えば、3台のホストで構成されているアプリケーションがあるとします。ある時点で、次のようなメトリクス値になっていたとします:

               throughput    response time
    hostA         305 rpm           240 ms
    hostB         310 rpm           250 ms
    hostC          30 rpm            50 ms

New Relicでは、application-levelレスポンス時間を次のように計算しています:

    hostA: 240 ms * 305 rpm = 73200 total time
    hostB: 250 ms * 310 rpm = 77500 total time
    hostC:  50 ms *  30 rpm =  1500 total time

    total throughput = 305 + 310 + 30 = 645 rpm
    average response time = (73200 + 77500 + 1500) / 645 = 236.0 ms

Datadogでは、以下のようにレスポンス時間の単純平均を計算しています:

    average response time = (240 + 250 + 50) / 3 = 180.0 ms


<!-- **Beta Alerts: How can I include custom tags?**

You can include custom tags by utilizing the "Use Custom Payload" option through New Relic's Beta Alerts feature. To configure this, you'll navigate to your New Relic account, and click the 'Alerts Beta' button in the upper right-hand corner of the screen. From here, select the 'Notification channels' section and find the Webhook you've setup for Datadog. From here there should be a section called 'Use Custom Payload', and once selected, it will expand to reveal a JSON payload. You need to modify this payload by adding a "tags" attribute. For example, a modified payload might look like this:

    {
      "account_id": "$ACCOUNT_ID",
      "account_name": "$ACCOUNT_NAME",
      "condition_id": "$CONDITION_ID",
      "condition_name": "$CONDITION_NAME",
      "current_state": "$EVENT_STATE",
      "details": "$EVENT_DETAILS",
      "event_type": "$EVENT_TYPE",
      "incident_acknowledge_url": "$INCIDENT_ACKNOWLEDGE_URL",
      "incident_id": "$INCIDENT_ID",
      "incident_url": "$INCIDENT_URL",
      "owner": "$EVENT_OWNER",
      "policy_name": "$POLICY_NAME",
      "policy_url": "$POLICY_URL",
      "runbook_url": "$RUNBOOK_URL",
      "severity": "$SEVERITY",
      "targets": "$TARGETS",
      "timestamp": "$TIMESTAMP",
      "tags": ["application:yourapplication", "host:yourhostname", "sometag"]
    }

After your modifications are complete, make sure you select 'Update Chanel', for your changes to be saved. -->

**Beta Alerts: カスタム タグを含めることができますか?**

データへのカスタムタグの付与は、New Relic の Beta Alerts 機能のカスタム ペイロード オプションを使用することで実現できます。この機能を設定するには、 New Relic アカウントに移動し、画面の右上にある 'Alerts Beta' ボタンをクリックします。次に、 'Notification channels' セクションを選択し、Datadog 用の Webhooks を確認します。ここで 'Use Custom Payload' を選択すると、 JSON ペイロードが内容が表示されるようになります。このペイロードを変更するには、"tags" 属性を追加します。例えば、変更されたペイロードは次のようになります:

    {
      "account_id": "$ACCOUNT_ID",
      "account_name": "$ACCOUNT_NAME",
      "condition_id": "$CONDITION_ID",
      "condition_name": "$CONDITION_NAME",
      "current_state": "$EVENT_STATE",
      "details": "$EVENT_DETAILS",
      "event_type": "$EVENT_TYPE",
      "incident_acknowledge_url": "$INCIDENT_ACKNOWLEDGE_URL",
      "incident_id": "$INCIDENT_ID",
      "incident_url": "$INCIDENT_URL",
      "owner": "$EVENT_OWNER",
      "policy_name": "$POLICY_NAME",
      "policy_url": "$POLICY_URL",
      "runbook_url": "$RUNBOOK_URL",
      "severity": "$SEVERITY",
      "targets": "$TARGETS",
      "timestamp": "$TIMESTAMP",
      "tags": ["application:yourapplication", "host:yourhostname", "sometag"]
    }

JSON の編集が完了したら、内容を保存するために 'Update Chanel' を必ず選択してください。

