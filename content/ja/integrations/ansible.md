---
last_modified: 2017/03/21
translation_status: complete
language: ja
title: Datadog-Ansible インテグレーション
integration_title: Ansible
kind: integration
newhlevel: true
doclevel: basic
git_integration_title: ansible
---

<!-- # Overview

![Ansible Dashboard](/static/images/ansibledashboard.png)

Install the Datadog Ansible callback integration to:

* Get real-time reports on Ansible server runs
* Track key Ansible performance metrics across all your servers
* Quickly identify and discuss failed Ansible runs with your team

For more information about using our integration with Ansible, read [this post on our blog](https://www.datadoghq.com/blog/ansible-datadog-monitor-your-automation-automate-your-monitoring/).
 -->

# 概要

![Ansible Dashboard](/static/images/ansibledashboard.png)

次の目的で Ansible のコールバック プラグインによる Datadog インテグレーションをインストールします:

* Ansible の実行結果に関するリアルタイム レポートを取得する。
* Ansible の主要パフォーマンス メトリクスを継続的に把握する。
* Ansible の失敗した実行結果を素早く特定し、チームで議論できるようにする。

Anatile インテグレーションの詳細については、 ["Ansible + Datadog: Monitor your automation, automate your monitoring"](https://www.datadoghq.com/blog/ansible-datadog-monitor-your-automation-automate-your-monitoring/) のブログ ポストを参照してください。


<!-- # Installation

1.  Ensure the prerequisite python libraries are installed on the server:

    * datadogpy
    * pyyaml (install with pip install pyyaml)

1.  Clone the [ansible-datadog-callback GitHub repo](https://github.com/datadog/ansible-datadog-callback).
1.  Copy datadog_callback.py to your playbook callback directory (by default callback_plugins/ in your playbook's root directory). Create the directory if it doesn't exist.
1.  Create a datadog_callback.yml file alongside datadog_callback.py, and set its contents with your API key, as following:

        api_key: <your-api-key>

1.  You should start seeing Ansible events and metrics appear on Datadog when your playbook is run.

To install the Datadog Agent using Ansible, refer to the [installation documentation here](https://app.datadoghq.com/account/settings#agent/ansible). -->

# インストール

1. 前提となっている Python ライブラリが、サーバにインストールされていることを確認します:

    * datadogpy
    * pyyaml (次のコマンドでインストールします: `pip install pyyaml`)

2. [ansible-datadog-callback](https://github.com/datadog/ansible-datadog-callback) の GitHub をリポジトリをクローンします。

3. datadog_callback.py を playbook のコールバックプラグインのディレクトリにコピーします。(デフォルトでは、 playbook のルートディレクトリの `callback_plugins/` になります) `callback_plugins/`が存在しない場合は、新たらに作成します。

4 datadog_callback.py と同じディレクトリに datadog_callback.yml ファイルを作成し、 API キーの記述と共に必要な項目を設定します:

        api_key: <your-api-key>

5. playbook が実行されると、 Datadog に Ansible のイベントとメトリクスが表示されるようにないります。

Ansible を使って Datadog Agent をインストールするには、Datadog のサイトの ["Agent install instruction"](https://app.datadoghq.com/account/settings#agent/ansible)を参照してください。


<!-- # Metrics

<%= get_metrics_from_git() %> -->

# メトリクス

<%= get_metrics_from_git() %> 
