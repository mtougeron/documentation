---
last_modified: 2017/03/16
translation_status: complete
language: ja
title: Datadog-Splunk インテグレーション
integration_title: Splunk
kind: integration
doclevel: basic
newhlevel: true
---

<!-- ### Overview
{:#int-overview}

Connect your Splunk log monitoring to be able to:

- Get notified of your reports.
- Correlate these reports with your other metrics
- Collaborate with your team on the events -->

# 概要

次の目的の為に、 Splunk のログ監視と Datadog を連携します:

* ログレポートに基づいて、通知を受ける
* ログレポートと他のアプリケーションの情報を連携し状況を把握する
* イベントの発生を検知し、チームで共同して作業をする


<!-- ### Installation

To receive your reports from Splunk into Datadog, you need to have ```datadog``` installed:

    #!shell
    pip install datadog


Once it is done, [get your api key and an application key](https://app.datadoghq.com/account/settings#api) and drop the following ```dog-splunk.sh``` script into $SPLUNK_HOME/bin/scripts
    
    #!shell
    #!/bin/bash
    export API_KEY=YOURAPIKEYHERE
    export APP_KEY=YOURAPPKEYHERE
    /opt/datadog-agent/bin/dog --api-key $API_KEY --application-key $APP_KEY event post \
    "Found $SPLUNK_ARG_1 events in splunk" \
    "Matching $SPLUNK_ARG_2 based on $SPLUNK_ARG_5," \
    " from report $SPLUNK_ARG_4. More details at $SPLUNK_ARG_6." \
     --aggregation_key $SPLUNK_ARG_3 --type splunk


Make sure the script is executable and owned by the ```splunk``` user and group. 

Once the script is in place, create a new report or navigate to an existing report. Click the **Edit Schedule** and check the checkbox to **Schedule the Report**. When you get to the option to **Run a Script**, enter ```dog-splunk.sh``` in the Filename textbox. Click **Save** and you should see the results start appearing in your Event Stream. -->


# 設定

1. python パッケージの `datadog` をインストールします。

        pip install datadog

2. Datadog のサイトで、 `Integrations` タブ -> [`APIs`](https://app.datadoghq.com/account/settings#api) を選択し、 API キーを取得します。

3. $SPLUNK_HOME/bin/scripts ディレクトリに、 `dog-splunk.sh` を準備します。

        #!shell
        #!/bin/bash
        export API_KEY=YOURAPIKEYHERE
        export APP_KEY=YOURAPPKEYHERE
        /opt/datadog-agent/bin/dog --api-key $API_KEY --application-key $APP_KEY event post \
        "Found $SPLUNK_ARG_1 events in splunk" \
        "Matching $SPLUNK_ARG_2 based on $SPLUNK_ARG_5," \
        " from report $SPLUNK_ARG_4. More details at $SPLUNK_ARG_6." \
         --aggregation_key $SPLUNK_ARG_3 --type splunk

    このスクリプトには実行権限があり、 ```splunk``` ユーザとグループに属していることを確認してください。


4. Splunk report に、新しいレポートを作成するか、既にあるレポートに移動します。 **"Edit Schedule"** をクリックし、 **"Schedule the Report"** チェックボックスをオンにします。 **"Run a Script"** オプションが表示されたら、ファイル名のボックスに ```dog-splunk.sh``` と入力し、 **"Save"** をクリックします。しばらくすると、 Splunk からの情報がイベント ストリームに表示されるようになります。


<!-- ### Troubleshooting

If you see an error code on each run of runshellscript in splunkd.log, try adding ``` > dog_splunk_trace.txt 2>&1``` to the end of the last command. This will create a ```$SPLUNK_HOME/etc/apps/search/bin/dog_splunk_trace.txt``` file. You will get more detail about the problem in this file.

If the trace file has something like the usage help for the ```dog``` command followed by ```dog: error: unrecognized arguments: OR failed OR severe```, you probably will need to add single quotes around $SPLUNK_ARG_3 on the last line. 

If the trace file include a Traceback that ends with ```pkg_resources.DistributionNotFound``` or something similar, add 3 unsets to the top of your dog-splunk.sh script to make it look like this:

    #!shell
    #!/bin/bash
    unset PYTHONHOME
    unset PYTHONPATH
    unset LD_LIBRARY_PATH
    export API_KEY=YOURAPIKEYHERE
    export APP_KEY=YOURAPPKEYHERE
    /opt/datadog-agent/bin/dog --api-key $API_KEY --application-key $APP_KEY event post \
    "Found $SPLUNK_ARG_1 events in splunk" \
    "Matching $SPLUNK_ARG_2 based on $SPLUNK_ARG_5," \
    " from report $SPLUNK_ARG_4. More details at $SPLUNK_ARG_6." \
     --aggregation_key $SPLUNK_ARG_3 --type splunk
 -->

# トラブルシューティング

splunkd.log 内に、 runshellscript が実行のたびにエラーコードが記録されている場合は、上記のシェル スクリプトの最後に ```> dog_splunk_trace.txt 2>&1``` を追加してみてください。この追加により、 ```$SPLUNK_HOME/etc/apps/search/bin/dog_splunk_trace.txt``` というファイルが作成されます。 このファイルには、より詳細なトレース情報が記録されています。

トレース ファイルに ```dog``` コマンドに続いて ```dog: error: unrecognized arguments: OR failed OR severe``` のような文字列がある場合は、おそらく 最終行の $SPLUNK_ARG_3 の前後に シングル クオート を追加する必要があります。

トレースファイルに ```pkg_resources.DistributionNotFound``` などで終わる トレース行が が含まれている場合は、 dogsplunk.sh スクリプトの先頭に以下の `unset` 行を追加します。

    #!shell
    #!/bin/bash
    unset PYTHONHOME
    unset PYTHONPATH
    unset LD_LIBRARY_PATH
    export API_KEY=YOURAPIKEYHERE
    export APP_KEY=YOURAPPKEYHERE
    /opt/datadog-agent/bin/dog --api-key $API_KEY --application-key $APP_KEY event post \
    "Found $SPLUNK_ARG_1 events in splunk" \
    "Matching $SPLUNK_ARG_2 based on $SPLUNK_ARG_5," \
    " from report $SPLUNK_ARG_4. More details at $SPLUNK_ARG_6." \
     --aggregation_key $SPLUNK_ARG_3 --type splunk


<!-- ### Customizing

The script file uses variables made available by Splunk. If you would like to customize the message, refer to the following table of variables:


| $SPLUNK_ARG_0 | Script Name |
| $SPLUNK_ARG_1 | Number of events returned |
| $SPLUNK_ARG_2 | Search terms |
| $SPLUNK_ARG_3 | Fully qualified query string |
| $SPLUNK_ARG_4 | Name of saved search |
| $SPLUNK_ARG_5 | Trigger reason (for example, "The number of events was greater than 1") |
| $SPLUNK_ARG_6 | Browser URL to view the saved search |
| $SPLUNK_ARG_7 | *option removed in version 3.6* |
| $SPLUNK_ARG_8 | File in which the results for this search are stored (contains raw results) |
{: .table}


You can modify the text of the events by for example using datadog's @mention to notify people of these reports. -->

# カスタマイズ

スクリプト ファイルには、Splunk が準備している変数を使用することができます。メッセージのカスタマイズに使用でき変数に関しては、以下の表を参照してください:

| $SPLUNK_ARG_0 | Script name |
| $SPLUNK_ARG_1 | Number of events returned |
| $SPLUNK_ARG_2 | Search terms |
| $SPLUNK_ARG_3 | Fully qualified query string |
| $SPLUNK_ARG_4 | Name of saved search |
| $SPLUNK_ARG_5 | Trigger reason (for example, "The number of events was greater than 1") |
| $SPLUNK_ARG_6 | Browser URL to view the saved search |
| $SPLUNK_ARG_7 | *option removed in version 3.6* |
| $SPLUNK_ARG_8 | File in which the results for this search are stored (contains raw results) |
{: .table}

又、メッセージ部分に @mention 記法を追加することにより、 Datadog の通知機能を使って、特定のメンバーにイベントを再転送することも出来ます。


------

<!-- *This documentation verified on October 28, 2015 using the [Splunk Enterprise AMI on AWS](https://aws.amazon.com/marketplace/pp/B00PUXWXNE/ref=sp_mpg_product_title?ie=UTF8&sr=0-3)* -->

*このドキュメントの内容は、2015年10月28日に [Splunk Enterprise AMI on AWS][2] を使用して検証しました。*


  [1]: https://wiki.splunk.com/Community:Use_Splunk_alerts_with_scripts_to_create_a_ticket_in_your_ticketing_system
  [2]: https://aws.amazon.com/marketplace/pp/B00PUXWXNE/ref=sp_mpg_product_title?ie=UTF8&sr=0-3