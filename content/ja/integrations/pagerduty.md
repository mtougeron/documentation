---
last_modified: 2017/03/15
translation_status: complete
language: ja
title: Datadog-PagerDuty インテグレーション
integration_title: PagerDuty
kind: integration
doclevel: basic
---

<!-- ### Overview
{:#int-overview}

Connect PagerDuty to Datadog in order to:

* Trigger and resolve incidents from your stream by mentioning @pagerduty in your post
* See incidents and escalations in your stream as they occur
* Get a daily reminder of who's on-call -->


### 概要

次の目的の為に、 pagerduty のメトリクスを Datadog に送信します:

* **@paperduty** を使ってメンションすることにより、イベントストリーム上でインシデントの発動と解除ができるようにする。
* インシデントとエスカレーションの発生状況を、 Datadog のイベントストリームで閲覧できるようにする。
* オンコール担当者に、日々リマインダーを送信する。


<!-- ![][3]You can also check out [this documentation][1] from Pagerduty.

Once you have Pagerduty integrated, you can check out our custom [Pagerduty Incident Trends][2].  -->

Pagerduty が公開している [次のドキュメント][1] も合わせて参照可能です。

インテグレーションの設定が完了すると、以下のような [Pagerduty Incident トレンド][2] リポートを毎週 email で受信することが出来ます。

![][3]


   [1]: http://www.pagerduty.com/docs/guides/datadog-integration-guide/
   [2]: https://app.datadoghq.com/report/pagerduty
   [3]: /static/images/pagerduty_incident_trends.png