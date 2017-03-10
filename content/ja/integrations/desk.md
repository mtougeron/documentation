---
last_modified: 2017/03/09
translation_status: complete
language: ja
title: Datadog-Desk インテグレーション
integration_title: Desk
kind: integration
git_integration_title: desk
---

<!-- ### Overview
{:#int-overview}

Connect Desk to Datadog to:

* Receive new case events in the event stream
* Visualize case stats by user and status
* View trends in support tickets alongside DevOps issues -->

## 概要

次の目的の為に、DeskとDatadogを連携します:

* Desk で発生した新イベントを Datadog へ送信しイベント ストリームに表示する。
* ユーザやステータスごとにケースを集計して可視化する。
* DevOpsの問題点と合わせて、サポート チケットのトレンドを把握する。


<!-- ## Configuration

From your Desk account, add an API application on the Settings -> API -> My Applications page (you made need administrator privileges.
Fill out the form as shown, leaving the latter two URL fields blank. Desk should then generate an application key, application secret, API access token, and API access token secret.

![][1]

Then from your Datadog account, enter the corresponding information on the [Desk tile][2]. You will also need to enter your company's unique Desk domain name.
Hit the install button, and then you're all set! You will soon be able to select desk.* metrics on a custom dashboard or view them on the provided [Desk dashboard][3]. (You can also read about this integration on [our blog][4].) -->

## 設定

Desk のアカウントにログインし、 `Setting` -> `API` -> `My Application` ページと移動し、 API アプリケーションを追加します。(この操作には、管理者権限が必要です。)

以下の画像のように、**Name** と **Website URL** に入力を済ませ、それ以外のURL項目はブランクにしておきます。 Add をクリックすると、 Desk が自動で consumer key、 consumer secret、 access token、access secret を生成します。

![][1]

次に、Datadog のインテグレーション ページから　[Desk のタイル][2]を選択し、先ほど Desk で生成した認証情報を入力します。次に、会社に割り当てられた Desk ドメイン名を入力します。

最後に、 `install` ボタンをクリックすると設定は終了です。しばらくすると、 Desk から取得したメトリクス( desk.* )をカスタム ダッシュボードで選択できるようになります。又、 Desk インテグレーションの[デフォルト ダッシュボード][3]でも、メトリクスが表示されるようになります。

Desk のインテグレーションに関しては、 blog 記事[「Keep support on the same page with the Salesforce Desk integration」][4]でも紹介しています。


<!-- ## Metrics

<%= get_metrics_from_git() %> -->

## メトリクス

<%= get_metrics_from_git() %>


   [1]: /static/images/desk_config.png
   [2]: https://app.datadoghq.com/account/settings#integrations/desk
   [3]: https://app.datadoghq.com/screen/integration/desk
   [4]: https://www.datadoghq.com/blog/keep-support-team-page-salesforce-desk-integration/