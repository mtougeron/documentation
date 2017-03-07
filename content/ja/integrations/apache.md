---
last_modified: 2017/03/07
translation_status: complete
language: ja
title: Datadog-Apache インテグレーション
integration_title: Apache
kind: integration
newhlevel: true
git_integration_title: apache
---

<!-- # Overview

![Apache Graph](/static/images/apachegraph.png)

Get metrics from Apache in real time; graph them and correlate them with other relevant system metrics and events.

  * Visualize your web server performance
  * Correlate the performance of Apache with the rest of your applications
-->

# 概要

![Apache Graph](/static/images/apachegraph.png)

Apacheからリアルタイムでメトリクスを取得しグラフ化すると共に、他の関連したメトリクスやイベントと相互に関係付ける。

* Webサーバのパフォーマンスの可視化する
* Apacheのパフォーマンスをインフラに含まれる他のアプリケーションと相互に関連付けて把握する


<!-- # Installation

Make sure that [`mod_status`][3] is installed on your Apache server with `ExtendedStatus` set to `on` -->

# インストレーション

Apache サーバーに `mod_status` がインストールされ、`ExtendedStatus` が `on` に設定されていることを確認してください。


<!-- # Configuration

*To capture Apache metrics you need to install the Datadog agent.*

1.  Configure the agent to connect to Apache. Edit `/etc/dd-agent/conf.d/apache.yaml`

        init_config:

        instances:
          - apache_status_url: http://example.com/server-status?auto
            # apache_user: example_user
            # apache_password: example_password
            tags:
              - instance:foo
            disable_ssl_validation: true # if you want to disable SSL cert validation
    {:.language-yaml}

2. Restart the agent

        sudo datadog-agent restart

<%= insert_example_links %> -->

### 設定

*Apache のメトリクスを取得するには、 Datadog Agent のインストールが必要です。詳細は、 [Datadog Agent 入門](/ja/guides/basic_agent_usage/)を参照して下さい。*

1. Datadog Agent が Apache にアクセスしてメトリクスを収集するためには、 `/etc/dd-agent/conf.d/apache.yaml` を編集します。

        init_config:

        instances:
          - apache_status_url: http://example.com/server-status?auto
            # apache_user: example_user
            # apache_password: example_password
            tags:
              - instance:foo
            disable_ssl_validation: true # if you want to disable SSL cert validation
    {:.language-yaml}

2. Datadog Agent を再起動します。

        sudo datadog-agent restart

<%= insert_example_links %>


<!-- # Validation

To ensure the integration is installed correctly, run the agent info command.

    sudo datadog-agent info

You should see something similar to the following if everything is working correctly:

    Checks
    ======

      [...]

      apache
      ------
          - instance #0 [OK]
          - Collected 8 metrics & 0 events -->

# 動作確認

インテグレーションが正しくインストールされていることを確認するには、次のコマンドを実行してください。

    sudo datadog-agent info

全てが正しくインストールされている場合は、次のようなインスタンスのステータスと集取できているメトリクスとイベントの項目数を確認することができます:

    Checks
    ======

      [...]

      apache
      ------
          - instance #0 [OK]
          - Collected 8 metrics & 0 events


<!-- # Metrics

The following metrics are collected by default with the Apache integration:

<%= get_metrics_from_git()%> -->

# メトリックス

Apache インテグレーションは、次のメトリクスをデフォルトで集取しています:

<%= get_metrics_from_git()%>


[1]: https://github.com/DataDog/integrations-core/blob/master/apache/conf.yaml.example
[2]: https://github.com/DataDog/integrations-core/blob/master/apache/check.py
[3]: http://httpd.apache.org/docs/2.0/mod/mod_status.html

