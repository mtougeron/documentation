---
last_modified: 2017/04/10
translation_status: complete
language: ja
title: Datadog-PaperTrail インテグレーション
integration_title: PaperTrail
kind: integration
git_integration_title: papertrail
newhlevel: true
doclevel: basic
---

<!-- # Overview

![Papertrail example](/static/images/papertrailexample.png)
{: style="max-width:600px;"}

Use Papertrail and Datadog to:

  * Turn freeform log data into actionable metrics
  * Centralize all text output: syslog, text log files, app hosting platforms (Heroku, Cloud Foundry)
  * Avoid silo-ed operational knowledge. See and correlate log-derived metrics alongside app- and system-level metrics. -->

# 概要

![Papertrail example](/static/images/papertrailexample.png)
{: style="max-width:600px;"}

以下の目的のために、Papertrail と Datadog を連携します:

* ログ データを、アクションを起こしやすいメトリクスに変換する。
* テキストによる出力を一元管理できるようにする: syslog, テキスト ログ ファイル, アプリケーション ホスティング プラットフォーム（Heroku、Cloud Foundry）からの出力など
* 運用ノウハウのサイロ化を避ける。ログから導き出されるメトリクスを単独で確認したり、アプリケーションやシステムレベルのメトリクスと相関させて状況を把握する。


<!-- # Installation

To capture metrics and events from Papertrail:

1.  In Papertrail's [event viewer](https://papertrailapp.com/events), save a search for the log event(s) which should be graphed.
1.  Enter the name for the search and click the **Save & Setup an Alert** button.
1.  Choose Datadog under Graphing & Metrics.

    ![Papertrail notifications](/static/images/papertrailnotify.png)
    {: style="max-width:500px;"}

1.  Choose your alert frequency and other details.
1.  Provide your Datadog API key, enter what you want to name your metric, and optionally enter some tags to associate with the metric.

    ![Papertrail notifications](/static/images/papertraildetails.png)
    {: style="max-width:500px;"}

1.  Click the **Create Alert** button.

Papertrail will update Datadog at your chosen interval. -->

# インストール

Papertrail からメトリクスとイベントを取得するには:

1. [Papertrail のイベント ビューア][1]で、グラフ化したいログ イベントの検索設定を保存する。
2. 検索設定に名前を入力し、**Save & Setup an Alert** ボタンをクリックする。
3. Graphing ＆ Metrics で Datadog を選択する。

    ![Papertrail notifications](/static/images/papertrailnotify.png)
    {: style="max-width:500px;"}

4. アラート頻度とその他の設定項目を選択していく。
5. Datadog API キーを入力し、メトリックの名前を入力する。必要に応じてメトリックに付与するタグを入力する。

    ![Papertrail notifications](/static/images/papertraildetails.png)
    {: style="max-width:500px;"}

6. **Create Alert** ボタンをクリックする。

ここまでの設定を終えると、先に設定した周期で Papertrail から Datadog へメトリックが送られるようになります。


<!-- # Configuration

No configuration steps are required for this integration.
 -->

# 設定

[Papertrail インテグレーション タイル][2]で、 **"Install Integration"** ボタンをクリックする。これ以外に、Datadog 側での設定はありません。


[1]: https://papertrailapp.com/events
[2]: https://app.datadoghq.com/account/settings#integrations
