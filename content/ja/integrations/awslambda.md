---
last_modified: 2017/03/09
translation_status: complete
language: ja
title: Datadog-AWS Lambda インテグレーション
integration_title: AWS Lambda
kind: integration
doclevel: basic
git_integration_title: amazon_lambda
---

<!-- ### Overview
Amazon Lambda is a compute service that runs code in response to events and automatically manages the compute resources required by that code.

Enable this integration to begin collecting custom metrics from your Lambda functions, and see them in Datadog.

To send custom metrics to Datadog, you must print a log line from your Lambda, using the following format:
<code>MONITORING|unix_epoch_timestamp|value|metric_type|my.metric.name|#tag1:value,tag2</code>

Please ensure the `unix_epoch_timestamp` is in seconds (not milliseconds).

For example, here is sample snippet for printing a valid custom metric, from your Lambda function (in Python):
<code>
unix_epoch_timestamp = int(time.time())
value = 42
metric_type = 'count'
metric_name = 'my.metric.name'
tags = ['tag1:value', 'tag2']
print('MONITORING|{0}|{1}|{2}|{3}|#{4}'.format(
    unix_epoch_timestamp, value, metric_type, metric_name, ','.join(tags)
))
</code>

Note: This integration requires the AWS permissions <code>logs:DescribeLogGroups</code>, <code>logs:DescribeLogStreams</code>, and <code>logs:FilterLogEvents</code> to be fully enabled. Also, counts and gauges are the only metrics types currently supported. -->


### 概要

Amazon Lambda は、イベントの発生時にコードを実行し、そのコードで必要とされるコンピューティング リソースを自動的に管理してくれる AWS サービスです。

このインテグレーションを有効にすると、 Lambda ファンクションから送信されるカスタム メトリクスを集取するようになり、 Datadog 内で 取り扱うことができるようになります。

Amazon ファンクションから送信されるカスタム メトリクスを Datadog クローラが収集できるようにするには、次の形式でログを出力します:

`MONITORING|unix_epoch_timestamp|value|metric_type|my.metric.name|#tag1:value,tag2`

`unix_epoch_timestamp` は、秒単位になっている必要があります。(ミリ秒ではありません)

#### コード サンプル

以下が、カスタム メトリックをログに出力するためのサンプル コードです( Python ):

    unix_epoch_timestamp = int(time.time())
    value = 42
    metric_type = 'count'
    metric_name = 'my.metric.name'
    tags = ['tag1:value', 'tag2']
    print('MONITORING|{0}|{1}|{2}|{3}|#{4}'.format(
        unix_epoch_timestamp, value, metric_type, metric_name, ','.join(tags)
    ))

注: このインテグレーションが完全に動作するは、 `logs:DescribeLogGroups`, `logs:DescribeLogStreams`、および `logs:FilterLogEvents` の AWS の権限が必要です。又、集取できるメトリクスのタイプは、 "counts" と "gauges" のみのサポートになります。


<!-- ### Metrics

<%= get_metrics_from_git()%> -->

### メトリクス

<%= get_metrics_from_git()%> 
