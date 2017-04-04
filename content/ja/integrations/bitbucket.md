---
last_modified: 2017/04/04
translation_status: complete
language: ja
title: Datadog-Bitbucket Integration
integration_title: Bitbucket
kind: integration
newhlevel: true
---

<!-- # Overview

Capture commits and pull requests events directly from your bitbucket to:

  * Keep track of code changes in real time
  * Add code change markers on all of your dashboards
  * Discuss code changes with your team

We've written extensively about the Bitbucket integration on our [blog][1].

![Bitbucket Integration](/static/images/integrations-bitbucket.gif)
Once the integration is complete, whatever you select (commits and/or pull requests) will populate
into your Datadog Event Stream.

* When commits are made
* When a PR is created
* When a comment is made/deleted on a PR

If you view a dashboard, in the top left search bar you can type ```sources:bitbucket``` to see bitbucket events overlayed over your the graphs on that dashboard. -->

# 概要

次の目的を実現するために、bitbucket から commits や pull request のイベント情報を取得します:

* コード変更をリアルタイムでトラッキングする。
* 全てのダッシュボードにコード変更のタイミングを上書きして表示する。
* コードの変更に関し、 Datadog のイベントストリーム上で議論できるようにする

Datadog blog の[「Understand how code changes impact system performance with Bitbucket and Datadog」](https://www.datadoghq.com/blog/understand-code-changes-impact-system-performance-bitbucket-datadog/)においても、 Bitbucket インテグレーションに関して詳しく記述しています。こちらも合わせて参照してください。

![Bitbucket Integration](/static/images/integrations-bitbucket.gif)

インテグレーションのインストールが完了すると、選択したもの（commit や、pull request）が Datadog の イベント ストリームに表示されるようになります。

* commit が実行されたとき
* pull request が作成されたとき
* pull request でコメントが作成/削除されたとき

ダッシュボード上の左上の検索窓で ```sources:bitbucket``` と入力すると、グラフ上に bitbucket イベントを上書き表示できます。


<!-- # Installation

On the Bitbucket website, create a new user that has **Read** access to the repo you want to monitor. This is the user that Datadog will use to collect information on the repository. -->

# インストール

On the Bitbucket website, create a new user that has **Read** access to the repo you want to monitor. This is the user that Datadog will use to collect information on the repository.

Bitbucket の Web サイトで、監視対象のリポジトリに **Read** アクセス権を持ったユーザーを追加します。これは、 Datadog がリポジトリに関する情報を収集するために使用するユーザです。



<!-- # Configuration

1.  Login to the Datadog application and add the [Bitbucket integration here][2].
2.  Enter the username and password you created above in the Installation section. Click the **Install Integration** button. If the username or password is not correct you will get a error message.
3.  Open the Bitbucket integration again and enter the full name of the repository you want to monitor. If the url for your repository is https://bitbucket.org/groupname/reponame, then enter ```groupname/reponame``` in the Repo full name textbox.
4.  Decide what type of events you would like to collect and click **Update Configuration**. -->

# 設定

1.  Login to the Datadog application and add the [Bitbucket integration here][2].
2.  Enter the username and password you created above in the Installation section. Click the **Install Integration** button. If the username or password is not correct you will get a error message.
3.  Open the Bitbucket integration again and enter the full name of the repository you want to monitor. If the url for your repository is https://bitbucket.org/groupname/reponame, then enter ```groupname/reponame``` in the Repo full name textbox.
4.  Decide what type of events you would like to collect and click **Update Configuration**.

1. Datadog サイトにログインし、次のリンク先のタイルより [Bitbucket インテグレーション][2] を追加します。
2. 上記で作成したユーザ名とパスワードをインストール セクションに入力します。 次に、 **Install Integration** ボタンをクリックします。ユーザ名又はパスワードが正しくない場合は、エラー メッセージが表示されます。
3. もう一度 Bitbucket インテグレーション タイル を開き、監視するリポジトリの完全な名前を入力します。 リポジトリのURLが https://bitbucket.org/groupname/reponame の場合、Repo full name テキストボックスに ```groupname/reponame``` と入力します。
4. 収集するイベントのタイプを決定し、 **Update Configuration** をクリックします。


<!-- # Validation

Each entry in the integration tile is validated when you enter it. There is nothing else you need to do. -->

# 動作確認

インテグレーション タイルに入力した内容は、入力時に検証されます。これ以外の設定作業はありません。



[1]: https://www.datadoghq.com/blog/understand-code-changes-impact-system-performance-bitbucket-datadog/
[2]: https://app.datadoghq.com/account/settings#integrations/bitbucket
