---
last_modified: 2017/04/05
translation_status: complete
language: ja
title: Datadog-Immunio インテグレーション
integration_title: Immunio
kind: integration
doclevel: basic
newhlevel: true
git_integration_title: immunio
---

<!-- # Overview

![Immunio Dashboard](/static/images/immunio_dash.png)

Connect IMMUNIO's advanced application security monitoring with Datadog to visualize the impact Attacks have on your web application, and monitor IMMUNIO's automatic protection.

IMMUNIO monitors your applications to detect and defend against all of the following:

* Account Takeover attacks like Brute Force, Credential Stuffing, etc.,
* Code-level attacks like XSS, SQLi, and Remote Command Execution,
* Custom business-level attacks like credit card fraud and other abuse,
* General bad behaviour like scanning and scraping. -->

# 概要

![Immunio Dashboard](/static/images/immunio_dash.png)

IMMUNIO は、高度なアプリケーション セキュリティ監視です。アカウントの乗っ取り、コードレベルの攻撃、カード詐欺などのビジネス レベルの攻撃、スキャンやスクレーピンなどの不適切なアクセスなどを監視しています。

以下の目的で、 IMMUNIO と Datadog を連携します:

* Web アカウントに対する攻撃に状況をリアルタイムで可視化する。
* 運用環境関連した他のメトリクスやイベントと連携し、攻撃の状況をリアルタイム把握する。
* 運用環境関連した他のメトリクスやイベントと連携し、攻撃の状況を複合的に判断しアラートをトリガする。


<!-- # Installation

1.  Login to [your IMMUNIO account](http://www.immun.io/).
1.  Navigate to the [integrations setup page](https://dashboard.immun.io/#/settings/integrations).
    ![Integration Setup Page](/static/images/immuniosetup1.png)
1.  Click "Add an API Key".
    ![Add API Key](/static/images/immuniosetup2.png)
1.  Add your API key. -->

# インストール

1. [IMMUNIO アカウント][1] にログインする。
2. IMMUNIO の[インテグレーション "settings" ページ][2]に、遷移する。
    ![Integration Setup Page][3]
3. "Add an API Key" をクリックする。
    ![Add API Key][4]
4. API キーを入力する。

[1]: http://www.immun.io/
[2]: https://dashboard.immun.io/#/settings/integrations
[3]: /static/images/immuniosetup1.png
[4]: /static/images/immuniosetup2.png


<!-- # Configuration

No configuration steps are required for this integration.
 -->

# 設定

このインテグレーションには、設定のステップはありません。

<!-- # Validation

To validate your installation and configuration, restart the agent and execute the info command. The output should contain a section similar to the following:


    Checks
    ======
      [...]
      immunio
      -----
          - instance #0 [OK]
          - Collected 4 metrics & 0 events -->

# 動作確認

インストールと設定を検証するには、 Agent を再起動した後、 info コマンドを実行します。コマンド実行の出力の "Checks" セクション以下には、以下のような "immunio" の項目が含まれている必要があります:

    Checks
    ======
      [...]
      immunio
      -----
          - instance #0 [OK]
          - Collected 4 metrics & 0 events


<!-- # Metrics

<%= get_metrics_from_git()%> -->

# メトリクス

<%= get_metrics_from_git()%>


<!-- # Events

No events are included with this integration. -->

# イベント

このインテグレーションは、イベントを集取してません。