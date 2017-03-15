---
last_modified: 2017/03/15
translation_status: complete
language: ja
title: Datadog-PHP インテグレーション
integration_title: PHP
kind: integration
doclevel: basic
newhlevel: true
---

<!-- # Overview

![PHP Graph](/static/images/phpgraph.png)

Connect your PHP applications to Datadog to:

* Visualize their performance
* Correlate their performance with the rest of your applications
* Monitor any relevant metric -->

# 概要

![PHP Graph](/static/images/phpgraph.png)

次の目的で、PHPアプリケーションのメトリクスをDatadogへ送信します:

* PHPアプリケーションのパフォーマンスを可視化する。
* PHPアプリケーションのメトリクスと他のアプリケーションメトリクスを連携し、状況を把握する。
* 関連するすべてのメトリクスを監視する。


<!-- # Installation

The PHP integration enables you to monitor any custom metric by instrumenting a few lines of code. 
For instance, you can have a metric that returns the number of page views or the time of any function call. 
For additional information about the PHP integration, please refer to this guide on submitting metrics. 
For advanced usage, please refer to the documentation in the repository.

1.  Install the library by cloning the Git repository:

        git clone git@github.com:DataDog/php-datadogstatsd.git

1.  Start instrumenting your code:

        # Require the datadogstatsd.php library file
        require './libraries/datadogstatsd.php';


        # Increment a counter.
        DataDogStatsD::increment('your.data.point');

1.  Go to the Metrics explorer page and see that it works!  -->

# インストール

PHP インテグレーションを使うことにより、アプリケーション内に数行のコードを追加することで、カスタム メトリックを Datadog に送信することが可能になります。例えば、ページ ビューの値や関数呼び出しに掛かる時間を計測し、メトリックとして送信することができます。
PHP インテグレーションに関する詳細情報については、["DogStatsD を使った、メトリクスの送信"][1]のガイドを参照してください。
更に高度な使い方については、["DataDog/php-datadogstatsd"][2]リポジトリのドキュメントを参照してください。

1. Git リポジトリを クローンしてライブラリをインストールします:

        git clone git@github.com:DataDog/php-datadogstatsd.git

2. 以下のようにコードに追記していきます:

        # Require the datadogstatsd.php library file
        require './libraries/datadogstatsd.php';


        # Increment a counter.
        DataDogStatsD::increment('your.data.point');

3. ダッシュボードの Metrics explorer のページからメトリクスが送信されているか確認します。


[1]: /ja/guides/metrics/
[2]: hhttps://github.com/DataDog/php-datadogstatsdgent
