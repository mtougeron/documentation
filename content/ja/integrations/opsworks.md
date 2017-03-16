---
last_modified: 2015/03/15
translation_status: complete
language: ja
title: Datadog-AWS OpsWorks インテグレーション
integration_title: AWS OpsWorks
kind: integration
doclevel: basic
git_integration_title: amazon_ops_works
newhlevel: true
---

<!-- [AWS OpsWorks](https://aws.amazon.com/blogs/aws/category/ops-works/) is a configuration management service that helps you configure and operate applications of all shapes and sizes using Chef. You can define the application’s architecture and the specification of each component including package installation, software configuration and resources such as storage. Start from templates for common technologies like application servers and databases or build your own to perform any task that can be scripted. AWS OpsWorks includes automation to scale your application based on time or load and dynamic configuration to orchestrate changes as your environment scales.

Enable this integration to see in Datadog all your Ops Works metrics. You can select the Opsworks check box in the [AWS integration tile](https://app.datadoghq.com/account/settings#integrations/amazon_web_services).
 -->

# 概要

[AWS OpsWorks][1]は、Chef を使って様々なタイプのアプリケーションを設定し、運用するための設定管理サービスです。パッケージのインストール、ソフトウェア構成、およびストレージなどのリソースを含むアプリケーションの各コンポーネントの仕様とアーキテクチャとを定義できます。一般的なアプリケーション サーバやデータベースなどのテンプレートから開始したり、独自のスクリプトを作成したりして、スクリプト化したタスクを実行することができます。 AWS OpsWorks には、時間や負荷に基づいてアプリケーションをスケールするための自動化機能や、環境の規模に応じて調整するための動的な構成変更の機能が含まれています。

このインテグレーションを有効にすると、OpsWorks の全てのメトリクスを Datadog で監視することができるようになります。[AWS サービス インテグレーション][2] タイルで Opsworks のチェック ボックスを選択して機能を有効にします。


<!-- ## Metrics

<%= get_metrics_from_git() %> -->


# メトリクス

<%= get_metrics_from_git() %>

[1]: https://aws.amazon.com/blogs/aws/category/ops-works/
[2]: https://app.datadoghq.com/account/settings#integrations/amazon_web_services
