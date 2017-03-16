---
last_modified: 2017/03/16
translation_status: complete
language: ja
title: Datadog-Ruby インテグレーション
integration_title: Ruby
kind: integration
doclevel: basic
newhlevel: true
---

<!-- # Overview

The Ruby integration allows you to monitor custom metrics by simply adding a few lines of code to your Ruby application. For example, you can have a metric that returns the number of page views or the time of any function call. For additional information about the Ruby integration, please refer to [the guide on submitting metrics](/guides/metrics). For advanced usage, please refer to the documentation in the repositories listed below. You can also review [the API docs](/api) for details on how to use the API with Ruby.

Datadog offers two libraries to assist you with the implementation of Ruby application metrics:

* [dogstatsd-ruby](https://github.com/DataDog/dogstatsd-ruby) A client for DogStatsD, an extension of the StatsD metric server for Datadog.
* [dogapi-rb](https://github.com/DataDog/dogapi-rb) The Ruby client is a library suitable for inclusion in existing Ruby projects or for development of standalone scripts. It provides an abstraction on top of Datadog's raw HTTP interface for reporting events and metrics. -->

# 概要

Ruby インテグレーションを使うことにより、アプリケーション内に数行のコードを追加することで、カスタム メトリックを Datadog に送信することが可能になります。例えば、ページ ビューの値や関数呼び出しに掛かる時間を計測し、メトリックとして送信することができます。Ruby インテグレーションに関する詳細情報については、["DogStatsD を使った、メトリクスの送信"][1]のガイドを参照してください。高度な使い方については、以下に紹介するリポジトリのドキュメントを参照してください。更に、 DogstasD ではなく、 API を使ってカスタム メトリクスを送信したい場合は、["the API docs"][2]も参照してください。 

Datadog は、Ruby アプリケーションからカスタム メトリクスを送信するために二つのライブラリを提供しています:

* [dogstatsd-ruby][3] Datadog による StatsD メトリック サーバの拡張である DogStatsD 用のクライアント。

* [dogapi-rb][4] このRuby クライアントは、既存の Ruby プロジェクトやスタンドアロン スクリプトの開発に適したライブラリです。 イベントやメトリックを Datadog の HTTP インターフェースを直接経由して送信するための抽象化レーヤをを提供しています。

<!-- # Installation

1.  To install the Ruby client for the Datadog API:

        gem install dogapi

    To install the dogstatsd-ruby client for DogStatsD:

        gem install dogstatsd-ruby

2.  Start instrumenting your code using the Datadog API:

        # Load the Datadog API module.
        require 'rubygems'
        require 'dogapi'

        api_key = "abcdef123456"
        application_key = "fedcba654321"

        # Note that submitting events does not require the application key.
        dog = Dogapi::Client.new(api_key, application_key)

        # Send a new event.
        dog.emit_event(Dogapi::Event.new('Testing done, FTW'), :host => "my_host")

    Start instrumenting your code using the DogStatsD client:

        # Load the dogstats module.
        require 'datadog/statsd'

        # Create a stats instance.
        statsd = Datadog::Statsd.new('localhost', 8125)

        # Increment a counter.
        statsd.increment('page.views')

        # Record a gauge 50% of the time.
        statsd.gauge('users.online', 123, :sample_rate=>0.5) -->

# インストール

1. Datadog API 用の Ruby クライアントをインストールします:

        gem install dogapi

    DogStatsD のRuby クライアントの dogstatsd-ruby をインストールします:

        gem install dogstatsd-ruby

2. Datadog API を使ってデータを送信する場合は、以下の様にアプリケーション コードに追記をします:

        # Load the Datadog API module.
        require 'rubygems'
        require 'dogapi'

        api_key = "abcdef123456"
        application_key = "fedcba654321"

        # Note that submitting events does not require the application key.
        dog = Dogapi::Client.new(api_key, application_key)

        # Send a new event.
        dog.emit_event(Dogapi::Event.new('Testing done, FTW'), :host => "my_host")

    DogStatsD を使ってデータを送信する場合は、以下の様にアプリケーション コードに追記をします:

        # Load the dogstats module.
        require 'datadog/statsd'

        # Create a stats instance.
        statsd = Datadog::Statsd.new('localhost', 8125)

        # Increment a counter.
        statsd.increment('page.views')

        # Record a gauge 50% of the time.
        statsd.gauge('users.online', 123, :sample_rate=>0.5)


<!-- # Configuration

There is nothing that you need to do in the Datadog application to configure Ruby.

# Validation

Go to the [Metrics explorer page](https://app.datadoghq.com/metric/explorer) and see that it just works!
 -->

# 設定

 言語のアプリケーションからカスタム メトリクスを受信するために Datadog のサイト側で実施する作業はありません。


# 動作確認

Datadog サイトの [Metrics explorer][5] ページを表示し、カスタム メトリクスが存在しているかを確認します。


  [1]: /ja/guides/metrics
  [2]: /api
  [3]: https://github.com/DataDog/dogstatsd-ruby
  [4]: https://github.com/DataDog/dogapi-rb
  [5]: https://app.datadoghq.com/metric/explorer
