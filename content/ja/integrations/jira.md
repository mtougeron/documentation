---
last_modified: 2015/04/06
translation_status: complete
language: ja
title: Datadog-Jira インテグレーション
integration_title: Jira
kind: integration
doclevel: basic
newhlevel: true
---

<!-- # Overview

JIRA is an issue and project tracking system for software teams. This integration allows you to create tickets from triggered alerts in Datadog, and update existing tickets with new information as it arises. Additionally, you can see JIRA ticket creations as events within Datadog to overlay with all of your metrics.

![settings](/static/images/jira/JiraInstallation9.png) -->

# 概要

JIRA は、プロジェクトの進行状況や issue を追跡/管理するシステムです。このインテグレーションを有効にすることで Datadog が検知したアラートを使ってチケットを生成したり、新しい情報が顕在化した際にチケットを更新することができます。更に、JIRAのチケットの発生情報を Datadog 側でイベントとして保存しているため、発生タイミングをダッシュボード内の各グラフに上書き表示することができます。

![settings](/static/images/jira/JiraInstallation9.png)


<!-- # Installation

1. Navigate to your Jira account

2. Go to settings (Gear icon) –> Applications

	![settings](/static/images/jira/JiraInstallation2.png){:style="width:75%;"}

3. Under "Integrations" in left menu, Select Application Links

	![settings](/static/images/jira/JiraInstallation3.png){:style="width:75%;"}

4. Enter app.datadoghq.com as the URL to link –> press "Create new link"

	![settings](/static/images/jira/JiraInstallation4.png){:style="width:75%;"}

5. Fill in Application Name with any name (used simply for identification)

6. Leave Generic Application Selected

7. Check "Create Incoming Link"

8. Press Continue

	![settings](/static/images/jira/JiraInstallation5.png){:style="width:75%;"}

9. Copy and Paste the Consumer Key, Consumer Name, and Public Key from the Jira tile

10. Press Continue

	![settings](/static/images/jira/JiraInstallation6.png){:style="width:75%;"} -->

# インストール

1. Jira のアカウントのログインする。

2. 歯車のアイコン("setting")をクリックし、"Application" を選択する。

    ![settings](/static/images/jira/JiraInstallation2.png){:style="width:50%;"}

3. 左側のメニューで、"Integrations" 項目にある "Application links" をクリックする。

    ![settings](/static/images/jira/JiraInstallation3.png){:style="width:50%;"}

4. URL として，**app.datadoghq.com** を入力し、"Create new link" ボタンをクリックする。

    ![settings](/static/images/jira/JiraInstallation4.png){:style="width:50%;"}

5. "Application Name" に、アプリケーション名を入力する。(識別のために使用)

6. "Application Type"で、**Generic Application** を選択する。

7. "Create Incoming Link" にチェックマークを付ける。

8. 右下の"Continue" ボタンをクリックします。

    ![settings](/static/images/jira/JiraInstallation5.png){:style="width:50%;"}

9. Datadog の [Jira インテグレーション タイル][1]で取得した "Consumer Key", "Consumer Name", "Public Key" の情報を入力する。

10. "Continue" ボタンをクリックする。

    ![settings](/static/images/jira/JiraInstallation6.png){:style="width:50%;"}


<!-- # Configuration

11. Navigate back to the Jira Tile

12. Copy and paste the URL of your Jira account into the tile from http... to .net i.e https://some-account.atlassian.net

13. Press Install

	![settings](/static/images/jira/JiraInstallation7.png){:style="width:75%;"} -->

# 設定

1. 今一度、[Jira インテグレーション タイル][1] を表示する。
2. Jira アカウントの URL を、タイル内の"2. Enter the URL for your Jira account."の欄へコピペする。(例: https://some-account.atlassian.net)
3. "Setup OAuth1" ボタンをクリックする。

    ![settings](/static/images/jira/JiraInstallation7.png){:style="width:75%;"}


<!-- ## Setting up Ticket Types

After installing the JIRA integration, you can create custom tickets types that can be created within Datadog.

1. To begin, press "Add Ticket Type"
2. Each ticket type stems from a unique Project ID – Issue Type combination. 
3. Select a Project ID and Issue Type for the ticket type you would like to create.
4. A list of required fields will show up for the selected combination.
5. Each of these fields must be filled out in order for tickets to be created.
6. Optionally, you can add Datadog tags in the form of key1:value1, key2:value2 for this ticket.
7. Press "Save Ticket Type".

Raw values as well as variables from the alert event can be used to fill in these fields.

A full list of variables can be seen below.

|Variable|Meaning|
|-----|-----|
|$ID | ID of the event *(ex: 1234567)*|
|$EVENT_TITLE| Title of the event *(ex: \[Triggered] \[Memory Alert])*|
|$EVENT_MSG| Text of the event *(ex: @webhook-url Sending to the webhook)*|
|$EVENT_TYPE| Type of the event *(ex: metric_alert_monitor)*|
|$LAST_UPDATED| Date when the event was last updated|
|$DATE| Date *(epoch) where the event happened *(ex: 1406662672000)*|
|$AGGREG_KEY| ID to aggregate events belonging together *(ex: 9bd4ac313a4d1e8fae2482df7b77628)*|
|$ORG_ID| ID of your organization *(ex: 11023)*|
|$ORG_NAME| Name of your organization *(ex: Datadog)*|
|$USER| User posting the event that triggered the webhook *(ex: rudy)*|
|$SNAPSHOT| Url of the image if the event contains a snapshot *(ex: https://url.to.snpashot.com/)*|
|$LINK| Url of the event *(ex: https://app.datadoghq.com/event/jump_to?event_id=123456)*|
|$PRIORITY| Priority of the event *(ex: normal)*|
|$TAGS| Comma-separated list of the event tags *(ex: monitor, name:myService, role:computing-node)*|
|$TEXT_ONLY_MSG| Text of the event without markdown formatting|
|$ALERT_ID| ID of alert *(ex: 1234)*|
|$ALERT_METRIC| Name of the metric if it's an alert *(ex: system.load.1)*|
|$ALERT_QUERY| Query of the monitor that triggered the webhook|
|$ALERT_STATUS| Summary of the alert status *(ex: system.load.1 over host:my-host was > 0 at least once during the last 1m)*|
|$ALERT_TRANSITION| Type of alert notification *(ex: Triggered)*|
{:.table} -->

## チケット タイプの設定

JIRA インテグレーションをインストールすると、Datadog 内の @notification 構文でしてできるカスタム チケット タイプを作成できます。

1. "Setup OAuth1"をクリックし、しばらくするとインテグレーション タイルのポップアップに "Add Ticket Type" ボタンが表示されます。このボタンをリックすると、新しいチケット タイプを設定するための項目が表示されます。
2. チケット タイプは、プロジェクト名と issue タイプの組み合わせになります。プロジェクト名と issue タイプを入力し、新しいチケット タイプを作成します。
3. 登録作業中のチケット タイプを JIRA に投稿する際に必要なフィールドがリストとして表示されます。全てのフィールドに適切な情報が入力されていないとチケットを作成することができません。
4. オプションとして、チケットに key1：value1、key2：value2 の形式で Datadog のタグを追加することができます。
5. "Save Ticket Type"をクリックして、チケット タイプを保存します。
6. 同等の手順を繰り返し、チケット タイプを複数登録することができます。

"Required fields" には、直接文字列や数値を入力することができます。又、Datadog のアラート イベントが提供している変数を記入することもできます。以下に、使用可能な変数のリストを示します。


|Variable|Meaning|
|-----|-----|
|$ID | ID of the event *(ex: 1234567)*|
|$EVENT_TITLE| Title of the event *(ex: \[Triggered] \[Memory Alert])*|
|$EVENT_MSG| Text of the event *(ex: @webhook-url Sending to the webhook)*|
|$EVENT_TYPE| Type of the event *(ex: metric_alert_monitor)*|
|$LAST_UPDATED| Date when the event was last updated|
|$DATE| Date *(epoch) where the event happened *(ex: 1406662672000)*|
|$AGGREG_KEY| ID to aggregate events belonging together *(ex: 9bd4ac313a4d1e8fae2482df7b77628)*|
|$ORG_ID| ID of your organization *(ex: 11023)*|
|$ORG_NAME| Name of your organization *(ex: Datadog)*|
|$USER| User posting the event that triggered the webhook *(ex: rudy)*|
|$SNAPSHOT| Url of the image if the event contains a snapshot *(ex: https://url.to.snpashot.com/)*|
|$LINK| Url of the event *(ex: https://app.datadoghq.com/event/jump_to?event_id=123456)*|
|$PRIORITY| Priority of the event *(ex: normal)*|
|$TAGS| Comma-separated list of the event tags *(ex: monitor, name:myService, role:computing-node)*|
|$TEXT_ONLY_MSG| Text of the event without markdown formatting|
|$ALERT_ID| ID of alert *(ex: 1234)*|
|$ALERT_METRIC| Name of the metric if it's an alert *(ex: system.load.1)*|
|$ALERT_QUERY| Query of the monitor that triggered the webhook|
|$ALERT_STATUS| Summary of the alert status *(ex: system.load.1 over host:my-host was > 0 at least once during the last 1m)*|
|$ALERT_TRANSITION| Type of alert notification *(ex: Triggered)*|
{:.table}


<!-- ## Automatically Create Tickets from Datadog Alerts

To automatically have JIRA tickets created within Datadog alerts, use the @jira-projectname-issuetype command within the "Say what's happening" section of the new monitor creation process.

A new ticket will be created when this alert is triggered. 

The @jira-update command can be used to update existing tickets. This command will add a comment to the JIRA ticket with the text followed by the @jira-update command. 

TIP – It might be useful to use the @jira command within an #is_alert or #is_warning variable!

![settings](/static/images/jira/JiraInstallation8.png) -->

## Datadog のアラートから自動でチケットを作成する

To automatically have JIRA tickets created within Datadog alerts, use the @jira-projectname-issuetype command within the "Say what's happening" section of the new monitor creation process.

A new ticket will be created when this alert is triggered.

The @jira-update command can be used to update existing tickets. This command will add a comment to the JIRA ticket with the text followed by the @jira-update command.

TIP – It might be useful to use the @jira command within an #is_alert or #is_warning variable!

Datadog のアラートから自動的で JIRA のチケットを作成するには、Monitor 設定画面の "Say what's happening" セクションの @jira-projectname-issue_type 構文を指定します。これで、アラート メッセージが JIRA に向かって送信され、新しいチケットが作成されます。

@jira-update 構文は、既存のチケットを更新するために使用することができます。@jira-update の続くテキストが、JIRA のチケットにコメントとして追加されます。

ヒント - `{{#is_alert}}` 変数または `{{#is_warning}}` 変数などの条件式と併用して @jira 構文を使用すると便利です。



![settings](/static/images/jira/JiraInstallation8.png)

<!-- # Validation

Check to see if you can select a Project when creating a new Ticket Type. If this dropdown is empty, it means the integration is not properly installed (or your Jira account has no Projects!)
 -->

# 動作確認

チケット タイプを新しく登録する際に、タイル内でプロジェクト名を選択できるかどうかを確認してください。プロジェクト名のドロップ ダウンが空の場合は、インテグレーションが正しくインストールされていないか、Jira の
アカウント内にプロジェクトが存在していないことを意味しています。


[1]: https://app.datadoghq.com/account/settings#integrations/jira
