---
last_modified: 2015/07/17
translation_status: complete
language: ja
title: System Integrations
integration_title: System
kind: integration
newhlevel: true
git_integration_title: system
updated_for_agent: 5.8.5
---

<!-- # Overview

Get metrics from your base system about the CPU, IO, load, memory, processes, swap, and uptime. Other system-related checks can be found here:

* [Directory Check](/integrations/directory) - Capture metrics from the files in given directories.
* [Disk Check](/integrations/disk) - Capture metrics about the disk
* [Process check](/integrations/process/) - Capture metrics from specific running processes on a system.
 -->

# 概要

システムから CPU, IO, 負荷, メモリ, プロセス, スワップ, 稼働時間などのメトリクスを取得します。

その他のシステムに関連したメトリクスは、以下のインテグレーションで取扱ます:

* [Directory check](/ja/integrations/directory/) - 任意のディレクトリのファイルに関するメトリクスを収集し、送信します。
* [Disk Check](/integrations/disk) - ディスクに関するメトリクスを収集し、送信します。
* [Process check](/ja/integrations/process/)- システム内で動作している任意のプロセスのメトリクスを収集し、送信します。

<!-- # Configuration

No configuration is necessary for the system. -->


# インストール

Datadog サイトの [Agent ページ](https://app.datadoghq.com/account/settings#agent)から、監視対象になっている OS 向けの一行スクリプトをコピーして実行してください。

# 設定

Datadog のサイト上での設定は必要ありません。

<!-- # Metrics

<%= get_metrics_from_git('system', 'system.cpu,system.io,system.load,system.mem,system.proc,system.processes,system.swap,system.uptime') %> -->

# メトリクス

<%= get_metrics_from_git('system', 'system.cpu,system.io,system.load,system.mem,system.proc,system.processes,system.swap,system.uptime') %>
