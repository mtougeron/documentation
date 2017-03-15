---
last_modified: 2017/03/15
translation_status: complete
language: ja
title: Datadog-Python インテグレーション
integration_title: Python
kind: integration
doclevel: basic
---

<!-- # Overview

The Python integration enables you to monitor any custom metric by instrumenting a few lines of code. For instance, you can have a metric that returns the number of page views or the time of any function call. For additional information about the Python integration, please refer to [the guide on submitting metrics](/guides/metrics). For advanced usage, please refer to [the documentation in the repository](https://github.com/DataDog/datadogpy). You can also review [the API docs](/api) for details on how to use the API with Python.
 -->

# 概要

Python インテグレーションを使うことにより、アプリケーション内に数行のコードを追加することで、カスタム メトリックを Datadog に送信することが可能になります。例えば、ページ ビューの値や関数呼び出しに掛かる時間を計測し、メトリックとして送信することができます。Python インテグレーションに関する詳細情報については、["DogStatsD を使った、メトリクスの送信"][1]のガイドを参照してください。高度な使い方については、["DataDog/datadogpy"][2]リポジトリのドキュメントを参照してください。更に、 DogstasD ではなく、 API を使ってカスタム メトリクスを送信したい場合は、["the API docs"][3]も参照してください。 


<!-- # Installation

1.  To install from pip:

        pip install datadog

2.  Start instrumenting your code:

        # Configure the module according to your needs
        from datadog import initialize

        options = {
            'api_key':'api_key',
            'app_key':'app_key'
        }

        initialize(**options)

        # Use Datadog REST API client
        from datadog import api

        title = "Something big happened!"
        text = 'And let me tell you all about it here!'
        tags = ['version:1', 'application:web']

        api.Event.create(title=title, text=text, tags=tags)


        # Use Statsd, a Python client for DogStatsd
        from datadog import statsd

        statsd.increment('whatever')
        statsd.gauge('foo', 42)

        # Or ThreadStats, an alternative tool to collect and flush metrics,using Datadog REST API
        from datadog import ThreadStats
        stats = ThreadStats()
        stats.start()
        stats.increment('home.page.hits')

 -->

# インストール

1. pipを使って dadogpy をインストールします:

        pip install datadog

2. 以下のようにアプリケーション コードに追記をします:

        # Configure the module according to your needs
        from datadog import initialize

        options = {
            'api_key':'api_key',
            'app_key':'app_key'
        }

        initialize(**options)

        # Use Datadog REST API client
        from datadog import api

        title = "Something big happened!"
        text = 'And let me tell you all about it here!'
        tags = ['version:1', 'application:web']

        api.Event.create(title=title, text=text, tags=tags)


        # Use Statsd, a Python client for DogStatsd
        from datadog import statsd

        statsd.increment('whatever')
        statsd.gauge('foo', 42)

        # Or ThreadStats, an alternative tool to collect and flush metrics,using Datadog REST API
        from datadog import ThreadStats
        stats = ThreadStats()
        stats.start()
        stats.increment('home.page.hits')


<!-- # Configuration

There is nothing that you need to do in the Datadog application to configure Python. -->

# 設定

Python 言語のアプリケーションからカスタム メトリクスを受信するために Datadog のサイト側で実施する作業はありません。


<!-- # Validation

Go to the [Metrics explorer page](https://app.datadoghq.com/metric/explorer) and see that it just works! -->

# 動作確認

Datadog サイトの [Metrics explorer][4] ページを表示し、カスタム メトリクスが存在しているかを確認します。

  [1]: /ja/guides/metrics
  [2]: https://github.com/DataDog/datadogpy
  [3]: /api
  [4]: https://app.datadoghq.com/metric/explorer
