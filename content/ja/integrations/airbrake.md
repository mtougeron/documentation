---
last_modified: 2017/03/07
translation_status: complete
language: ja
title: Datadog-Airbrake インテグレーション
integration_title: Airbrake
kind: integration
doclevel: basic
newhlevel: true
git_integration_title: airbrake
---
<!--
# Overview

![Airbrake Event](/static/images/airbrakeevent.png)
{: style='width: 500px;'}

Connect Airbrake to Datadog to:

  * See exceptions in the stream, in real time
  * Search for exceptions in your graphs
  * Discuss exceptions with your team
  -->

## 概要

![Airbrake Event](/static/images/airbrakeevent.png)
{: style='width: 500px;'}

Airbrake と Datadog の連携

* リアルタイムで、例外をイベントストリームに表示します。
* グラフ内で、例外を検索することが出来るようになります。
* 例外に関して、イベントストリームでコミュニケーションを取ることが出来ます。


<!-- # Configuration

Go to your Airbrake account page and copy your Account Name and Token into the form below.
You can either choose to follow all projects or specify a project name to follow.
If "All projects" box is ticked and a project name is specified, all projects will be followed.
 -->

## 設定

Airbrake の ”account_name” ページから、アカウント名とトークンを取得し、インテグレーションタイル内のフォームにコピーします。

![](/static/images/ja-specific/snapshot_airbrake_small.png)

特定のプロジェクトのみを連携することも出来ます。特定のプロジェクトだけをフォローする場合は、プロジェクト名を指定します。
全てのプロジェクトをフォローする場合、 `All projects` にチェックマークを設定します。

<!-- # Metrics

<%= get_metrics_from_git()%> -->

# メトリクス

<%= get_metrics_from_git()%>