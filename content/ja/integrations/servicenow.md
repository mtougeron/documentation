---
last_modified: 2017/03/16
translation_status: original
language: ja
title: Datadog-ServiceNow インテグレーション
integration_title: ServiceNow
kind: integration
doclevel: full
newhlevel: true
---

# 概要

<!-- ServiceNow is an IT service management platform for recording, tracking, and managing a company’s enterprise-level IT processes in a single location. This integration allows you to create tickets from triggered alarms in Datadog. Additionally, you can add Datadog-generated graphs and comments to ServiceNow tickets, as well as manage the resolution workflow from within Datadog -->

ServiceNow は、エンタープライズ レベルの IT プロセスを一カ所に記録、追跡、管理するためのITサービス管理プラットフォームです。このインテグレーションを使うことにより、 Datadog が検知したアラートを ServiceNow 上でチケットとして登録することができるようになります。更に、 Datadog でキャプチャしたグラフやコメントを ServiceNow のチケットに追加するだけでなく、 Datadog 内から解決ワークフローを管理することもできます。



<!-- ### Configure ServiceNow

To configure the ServiceNow integration, enter your ServiceNow instance name, and the username and password. We recommend creating a new user for the Datadog integration.

![servicenow integration](/static/images/servicenow-configuration.png) -->

# 設定

ServiceNow のインテグレーションを設定するには、 ServiceNow インスタンス名、およびユーザ名とパスワードを入力します。 インテグレーションの登録には、 Datadog 用に ServiceNow での新規ユーザーを作成することを推奨します。

![servicenow integration](/static/images/servicenow-configuration.png)


<!-- ### Auto-generate support tickets from Datadog alerts

Now, you can set these alerts to automatically create support tickets and send them to the ServiceNow ticketing queue. From there, your support team will be notified of issues using the communication workflows that you have already established inside ServiceNow. All you have to do is mention @servicenow in the alert message or add @servicenow to the notification list for that monitor.

![ServiceNow](/static/images/servicenow-02-monitor-page.png) -->

# Datadog のアラートからサポート チケットを自動生成

サポートチケットを自動的で作成し、 ServiceNow のチケットキューに送信するために、以下のアラートを設定することができます。一旦チケットが生成されると、サポートチームには、 ServiceNow 内に設定してあるコミュニケーション ワークフローに基づいて問題が通知がされます。チケットの自動生成に必要なアラート内の設定は、アラート メッセージ欄に @servicenow とメッセージを併記するか、 @servicenow をモニタの通知リストに追加するだけです。


![ServiceNow](/static/images/servicenow-02-monitor-page.png)

<!-- ### Use variables in ticket payload and field mappings
 
Variables can be used in the body of your alerts or in field mappings to ensure rich details from the event are included in ServiceNow.  For example, you can include the title and severity in the appropriate ServiceNow field or you can include a link back to the specific incident in Datadog right from the ServiceNow ticket.

![ServiceNow Variables](/static/images/servicenow-variables.png) 
 -->

# チケットの設定項目を変数で操作 (対応リスト設定)

アラートの本文で変数を使うか、変数対応リストを設定することで、イベントの詳細な情報を ServiceNow に送信することができるようになります。例えば、タイトルと重要度を ServiceNow の適切なフィールドに書き加えることができます。又、Datadog 上の該当しているインシデントに移動するための URL リンクを書き込むこともできます。

![ServiceNow Variables](/static/images/servicenow-variables.png) 

<!-- ### Automate support resolution workflow

Once the monitor state returns to normal, the associated support ticket is automatically marked as “resolved”.

![ServiceNow Resolved](/static/images/servicenow-03-servicenow-resolved.png) -->

# サポートの解決ワークフローの自動化

Monitor の状態が正常に戻った後は、関連するサポートチケットは、自動的に「解決」としてマークされています。

![ServiceNow Resolved](/static/images/servicenow-03-servicenow-resolved.png)


<!-- ### Send Datadog graphs to ServiceNow

In addition to automating ticket creation and resolution, you can also use Datadog to create ServiceNow tickets on an ad hoc basis whenever you see something in Datadog that needs your team’s attention. Just click the camera icon to share a snapshot of any Timeboard graph, add some context in the comment box to help your colleagues interpret the graph, and @mention ServiceNow to send the graph and your comments to ServiceNow.

![annotation](/static/images/servicenow-04-mention-servicenow.png) -->

# Datadog のグラフを ServiceNow に送信する

アラートらかのチケットの作成と解決を自動化するだけでなく、チームの注目が必要な項目を Datadog 上で見つけた際は、 Datadog のスナップショット機能を使用して ServiceNow のチケットを随時作成することもできます。グラフ右上隅にあるカメラ アイコンをクリックすると、グラフのスナップショットとコメント ボックスが表示されます。コメント ボックスに @servicenow と注釈を併記し、キーボードの `Enter` ボタンで保存と送信をします。

![annotation](/static/images/servicenow-04-mention-servicenow.png)



















