---
last_modified: 2017/03/16
translation_status: complete
language: ja
title: Datadog-SumoLogic インテグレーション
integration_title: SumoLogic
kind: integration
newhlevel: true
---

<!-- 1. Enable the Datadog integration on the Sumo Logic side
2. To send Datadog events and alerts to Sumo Logic, create a new HTTP Collector in Sumo Logic (Manage > Collectors > Add Collector) and copy paste the collector's url. -->

# 概要

次の目的で、Sumo LogicとDatadogを連携します:

* Sumo Logicに蓄積しているログデータをDatadogが取得しているメトリクスと関連付ける。
* Sumo Logicへアラート通知を送信する。


<!-- ## Installation

There are two parts to the SumoLogic integration, based on the direction of information between the products. You can send alerts and events from Datadog to Sumologic and you can have SumoLogic send data to Datadog. -->

# 設定

SumoLogic のインテグレーションの設定には、情報が流れる方向に基づいて二つの部分があります。
先ず、Datadog から Sumologic にアラートとイベントを送信する部分です。次に、SumoLogic からデータを Datadog に送信する部分です。


<!-- ### Datadog to SumoLogic

1. Login to SumoLogic.
2. From the main menu, choose **Manage** -> **Collection**.
3. Click the **Add Collector** link at the top left. ![Hosted Collection](/static/images/integrations-sumo-hostedcollector.png)
4. Choose **Hosted Collector**.
5. Enter a Name and optionally a description, category, and time zone. Click **Save**.
6. Click **HTTP** under Cloud APIs. Fill in the form as appropriate for the collector. Click **Save**.
7. Copy the URL given on the next dialog. You will need this again soon.
8. Go to the [SumoLogic Integration settings](https://app.datadoghq.com/account/settings#integrations/sumo_logic) screen in Datadog.
9. Enter the name you want to assign to the collector and the URL from above.
10. Next time you want to send a message from Datadog to SumoLogic, use **@sumologic-{YOUR COLLECTOR NAME}**.
 -->

## Datadog から SumoLogic への送信設定

1. SumoLogic にログインします。

2. メインメニューから、**Manage** -> **Collection** を選択します。

3. 左上の **Add Collector** リンクをクリックします。

    ![Hosted Collection](/static/images/integrations-sumo-hostedcollector.png)

4. **Hosted Collector** を選択します。

5. 名前と、必要に応じて説明, カテゴリ, タイムゾーンを入力します。 **Save** をクリックします。

6. Cloud API の下にある **HTTP** をクリックします。フォームに記入し、 **Save** をクリックします。

7. 次のダイアログで指定された URL をコピーします。この URL が、Datadog の SumoLogic インテグレーション タイルで必要になります。

8. Datadog の [SumoLogic インテグレーション タイル](https://app.datadoghq.com/account/settings#integrations/sumo_logic) の設定画面に移動します。

9. コレクタに割り当てる名前と上記の URL を入力します。

10. 最後に Datadog から SumoLogic にメッセージを送信するには、 **@sumologic-{YOUR COLLECTOR NAME}** を指定します。


<!-- ### SumoLogic to Datadog

1. Login to SumoLogic.
2. From the main menu, choose **Manage** -> **Connections**.
3. Click the **Add** button.
4. Click the **Datadog** button. ![Click the Datadog Button](/static/images/integrations-sumo-connectiontype.png)
5. Give the connection a Name and optionally a Description. For the URL, enter:

        https://app.datadoghq.com/api/v1/events?api_key=YOUR_API_KEY

6. Customize the payload as needed. Click the **Help** link to learn about the available variables.
7. Click **Test Connection**. You should see a new item in your Event Stream similar to this: ![Test Event](/static/images/integrations-sumo-event.png)
8. If everything looks good, click **Save**.
9. In SumoLogic, save any search and choose to schedule the search.
10. Choose Webhook for the **Alert Type**. Choose your new Datadog Connection from the list of webhooks. Optionally customize the Payload. You will probably want to change the **Alert Condition** to send a notification only if the number of results is greater than 0. ![Hosted Collection](/static/images/integrations-sumo-savesearch.png)
 -->

## SumoLogic から Datadog への送信設定

1. SumoLogic にログインします。

2. メインメニューから、**Manage** -> **Connections** を選択します。

3. **"Add"** ボタンをクリックします。

4. **"Datadog"** ボタンをクリックします。

    ![Click the Datadog Button](/static/images/integrations-sumo-connectiontype.png)

5. **connection** に名前を付け、必要に応じて説明を入力します。URL には、次のように入力します。

        https://app.datadoghq.com/api/v1/events?api_key=YOUR_API_KEY

6. 必要に応じて Payload を修正します。 利用可能な変数については **Help** リンクをクリックしてください。

7. **"Test Connection"** をクリックします。イベントストリームには、次のようなイベントが新しく表示されます。

    ![Test Event](/static/images/integrations-sumo-event.png)

8. 問題がなければ、 **"Save"** をクリックします。

9. SumoLogic で **search** を保存し、その **search** のスケジュールを設定します。

10. **Alert Type** で `Webhook` を選択します。 Webhooks のリストから Datadog Connection を選択してください。必要に応じて Payload を修正します。最後に、 **Alert Condition** を検討します。通知の煩雑性を考えると、”0より大きい場合にのみ”に変更することをお勧めします。

    ![Hosted Collection](/static/images/integrations-sumo-savesearch.png)

