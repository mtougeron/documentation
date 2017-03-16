---
last_modified: 2017/03/10
translation_status: complete
language: ja
title: Datadog-Google Cloud Platform インテグレーション
integration_title: Google Cloud Platform
kind: integration
git_integration_title: google_cloud_platform
newhlevel: true
---

<!-- ### Overview

Connect to Google Cloud Platform to:

* See your Google Compute Engine hosts in the infrastructure overview
* Import your Google Compute Engine host tags
* Tag your Google Compute Engine hosts with additional compute-specific metadata (e.g. zone)
-->

# 概要

次の目的で、Google Cloud Platform と Datadog を連携します:

* Google Compute Engine のホストを、インフラストラクチャービューに表示する。
* Google Compute Engine のホスト タグをインポートする。
* Google Compute Engine のホストに GCE 専用のメタデーター タグ(例: zone) を付与する。


<!-- ### Installation

From the Integrations page in the Datadog app, select the Google Cloud Platform tile. Switch to the **Configuration** tab and click the **Sign in with Google** button. After you allow access enter the email associated with the account and the Project you wish to monitor. Enter the Project ID for each project. The Project ID is the multi-word id and not the Project Number.

Optionally, you can limit the GCE instances that are pulled into Datadog by entering tags in the "Limit Metric Collection" textbox. Only hosts that match one of the defined tags will be imported into Datadog. Wildcards, such as '?' (for single characters) and '*' (for multiple characters) can also be used. Host matching a given tag can also be excluded by adding '!' before the tag.

~~~
e.x. datadog:monitored,env:production,instance-type:c1.*
~~~

![settings](/static/images/GCPSetup.png) -->

### インストール

Datadog のインテグレーション ページで、 Google Cloud Platform タイルを選択します。 `Configuration` タブに切り替えて、`Sign in with Google` ボタンをクリックし、 Google 認証のページでアクセスを許可します。追加の入力欄が表示されるので、監視対象のアカウントとプロジェクトに関連付けられた電子メールのアドレスを入力し、各プロジェクトのプロジェクト ID を入力します。プロジェクト ID はマルチワード ID で、プロジェクト番号ではありませんので注意してください。

必要に応じて "Limit Metric Collection" テキスト ボックスにタグ名を設定して、 Datadog が監視情報を集める GCE インスタンスを制限します。制限の基本は、"定義したタグのどれかと一致するホストの監視情報だけが Datadog にインポートされる"になります。応用的には、`'?'`(1文字の場合), `'*'`(複数文字の場合)などのワイルドカードを使うこともできます。指定したタグに一致したホストを除外したい場合は、`'!'`をタグの前に指定します。

~~~
e.x. datadog:monitored,env:production,instance-type:c1.*
~~~

![settings](/static/images/GCPSetup.png)


<!-- ### Metrics

<%= get_metrics_from_git() %> -->

### メトリクス

<%= get_metrics_from_git() %>


<!-- ### Tags Assigned

Tags are automatically assigned based on a variety of configuration options with regards to Google Cloud Platform and the Google Compute Engine. The following tags will be automatically assigned:

* Zone
* Instance-type
* Instance-id
* Automatic-restart
* On-host-maintenance
* Project
* Numeric_project_id
* Name

To learn more about tags in the Datadog platform, refer to the [Guide to Tagging](/guides/tagging) -->

### 監視情報に自動で付与されるタグ

Google Cloud Platform と Google Compute Engine の設定オプションの情報に基づいて、以下のタグが自動的に付与されます:

* Zone
* Instance-type
* Instance-id
* Automatic-restart
* On-host-maintenance
* Project
* Numeric_project_id
* Name

Datadog 上でタグをうまく使うこつに関しては、[Guide to Tagging][j1] を参照してください。


  [1]:/guides/tagging
  [j1]:/ja/guides/tagging
