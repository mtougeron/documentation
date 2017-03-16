---
last_modified: 2017/03/15
translation_status: complete
language: ja
title: Datadog-Github インテグレーション
integration_title: Github
kind: integration
autotocdepth: 1
newhlevel: true
---

<!-- ### Overview
{:#int-overview}

Capture GitHub commits in Datadog to:

- Track new features from code changes
- Identify when new code changes lead to system alerts or build failures
- Discuss code changes with your team in the Datadog Event Stream -->

# 概要
{:#int-overview}

次の目的で GitHub のコミット情報を Datadog と連携します:

- ソースコードの変更履歴から、フューチャ追加の追跡をする。
- アラート発生時やビルドの失敗時にソースコードの変更が起因していないかを確認する。
- ソースコードの変更に関し、 Datadog のイベントストリーム上でチャットをする。


<!-- ### Configuration
{:#int-configuration}

Select 'Github' [on the account settings screen][1] and link your account. You can then select which repos you would like to integrate, which branches, and if you'd like to receive commits and/or issues. -->

# 設定
{:#int-configuration}

Datadog のインテグレーションページで ["Github"][1] タイルを選択し、 `Configuration` タブから `Sign in with Github` をクリックして、アカウントを設定します。その後リポジトリ、ブランチ、コミットなどの情報を設定します。


<!-- ### What to Expect
Once the integration is complete, whatever you select (commits and/or issues) will populate
into your Datadog Event Stream.

If you view a dashboard, in the top left search bar you can type `sources:github` to see github
events overlayed over your the graphs on that dashboard. -->

## 連携が完了すると

インテグレーションの設定が完了すると、 GitHub への commits と issues のどちらか、または両方のイベントを、 Datadog のイベント ストリームに表示することができるようになります。

Timeboard 上では、左上隅の検索窓で `sources:github` と入力することで、グラフ内に github 上のイベントの発生タイミングをピンクの線として、上書き表示することができるようになります。


   [1]: https://app.datadoghq.com/account/settings
