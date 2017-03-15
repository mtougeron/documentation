---
last_modified: 2017/03/15
translation_status: complete
language: ja
title: Datadog-Pingdom インテグレーション
integration_title: Pingdom
kind: integration
git_integration_title: pingdom
newhlevel: true
---

<!-- # Overview

![Pingdom Event](/static/images/pingdomevent.png)

Track Pingdom downtime events and user-centric performance metrics in Datadog, for correlation with other relevant events and metrics.

At this time we track the response_time metric for any sites you configure on the Pingdom website.

*Note: Events and metrics can only be imported for Pingdom customers at the Starter level or above.* -->

# 概要

![Pingdom Event](/static/images/pingdomevent.png)

Pingdom のダウンタイム イベントやパフォーマンス メトリックを追跡し、 Datadog に送信することで、アプリケーションのメトリクスやイベントと連携し、インフラ全体の把握ができるようにします。

現在のインテグレーションの仕様では、 Pingdom で設定した任意のサイトの response_time メトリクスを追跡します。

*注: イベントとメトリクスを取得するには、 Starter レベル以上の Pingdom ユーザ ステータスが必要です。*


<!-- # Configuration

1.  Open the Pingdom integration tile.
1.  Enter the username and password to your Pingdom account.
    (If you have a Team account, you can use your own credentials and specify the account you wish to pull checks from.)
1.  You can ignore some checks by unchecking them or add some tags to the events that are going to be generated.

Note: Pingdom does not provide an API for transaction checks, so we’re not able to show them in Datadog.  -->

# 設定

1. Pingdom インテグレーション タイルからポップ アップを表示します。
2. Pingdom アカウントのユーザ名とパスワードを入力します。 (チーム アカウントに場合は、個人の認証情報と情報を引き出すアカウントを指定して実行することができます。)
3. 設定ページのチェック マックをと取り消すことでをチェック無視する ことができます。又、生成されるイベントにタグを追加することもできます。

注: Pingdom には、Datadog のトランザクション Check と連携するための API が提供されていません。したがって、 Datadog 側では、それらの情報を取得し、表示することが出来ません。


<!-- # Metrics

<%= get_metrics_from_git() %> -->

# メトリクス

<%= get_metrics_from_git() %>