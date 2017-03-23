---
last_modified: 2017/03/33
translation_status: complete
language: ja
title: Datadog-AWS RDS インテグレーション
integration_title: AWS RDS
kind: integration
git_integration_title: amazon_rds
newhlevel: true
---

<!-- # Overview

![RDS Dashboard](/static/images/rdsdashboard.png)

Amazon Relational Database Service (RDS) is a web service that makes it easy to setup, operate, and scale a relational database in the cloud. Enable this integration to see all your RDS metrics in Datadog

## How this works

There are 3 options for monitoring RDS instances. You can choose to use standard or enhanced, and then optionally turn on the native database integration as well if you wish.

* **Standard RDS Integration** - The standard integration requires selecting RDS on the left side of the AWS integration tile. You will receive metrics about your instance as often as your Cloudwatch integration allows. All RDS Engine types are supported.

* **Enhanced RDS Integration** - The enhanced integration requires additional configuration and is only available for MySQL, Aurora, and MariaDB engines. Additional metrics are available but an AWS Lambda is required to submit the metrics to Datadog. The higher granularity and additional required services may result in additional AWS charges.

* **RDS + Native Database Integration** - You can also choose to turn on the Native Database Integration. This is available for MySQL, Aurora, MariaDB, SQL Server, and Postgres engine types. To get the metrics from RDS and the ones from the native integration to match up, you will need to use the `dbinstanceidentifier` tag on the native integration based on the identifier you assign to the RDS instance. The RDS instances will automatically have the tag assigned. -->

# 概要

![RDS Dashboard](/static/images/rdsdashboard.png)

Amazon Relational Database Service（RDS）は、クラウド上に、リレーショナル データベースを導入、運用、および必要に応じ拡張することを容易にする AWS の管理サービスです。 このインテグレーションを有効にすることにより、 RDS に関連したメトリクスを Datadog 上で取り扱うことができるようになります。

## どのような仕組みで動作しますか

Amazon RDS のインスタンスの監視には三つの方法があります。AWS コンソールから標準、又はエンハンスドの設定を使用するように選択したり、必要に応じて採用したデータベース エンジン向けのネイティブ インテグレーションを使うこともできます。

* **標準的な RDS インテグレーション** - 標準的なインテグレーションの場合、 AWS インテグレーション タイルの左側のカラムで RDS を選択する必要があります。 Cloudwatch 経由でデータを集取している AWS インテグレーションの上限頻度で RDS インスタンスのメトリクスを集取します。このインテグレーションは、全 RDS エンジン タイプに対応しています。

* **エンハンスド RDS インテグレーション** - エンハンスド インテグレーションの場合、追加の設定が必要です。更に、 MySQL, Aurora, MariaDB エンジンでのみ使用できます。追加のメトリクスは、AWS lambda を使うことにより Datadog へ送信することができます。より高い精度のデータや追加で必要な AWS サービスには、追加のAWS料金が発生する可能性があります。

* **RDS + ネイティブ データベース インテグレーション** - ネイティブ データベース インテグレーションを有効にすることもできます。このネーティブ インテグレーションは、 MySQL, Aurora, MariaDB, SQL Server, Postgres のエンジン タイプで利用できます。

同一インスタンスから収集した RDS のメトリクスとネイティブ インテグレーションのメトリクスを一致させるには、 RDS インスタンスに割り当てた識別子に基づいて、ネイティブ インテグレーションで `dbinstanceidentifier` タグを使用して設定する必要があります。RDS インスタンスには自動的にタグが割り当てられます。


<!-- # Installation

* **Standard RDS Integration**

  No installation is required for the Standard RDS integration.

* **Enhanced RDS Integration**

  1.  Enable Enhanced Monitoring for your RDS instance. This can either be done during instance creation or afterwards by choosing **Modify** under **Instance Actions**. We recommend choosing 15 for Monitoring Granularity.
      ![][4]
  2.  From the IAM Management Console, click on **Encryption Keys**. Click the **Create Key** button.
  3.  Enter an Alias for the key, such as `lambda-datadog-key`.
  4.  Add the appropriate administrators and then users for the key. Ensure that you select yourself at least as a user.
  5.  Encrypt the key you just created by using the [AWS CLI][5]:

          aws kms encrypt --key-id alias/<KMS key name> --plaintext '{"api_key":"<datadog_api_key>", "app_key":"<datadog_app_key>"}'

      The KMS key name should be replaced by the alias of the key you just created. The datadog api and app keys should be replaced by [the api and app keys found here][6].

      The output of this command will include two parts: a ciphertext blob followed by the key ID that starts with something similar to **arn:aws:kms**.
  6.  From the IAM Management Console, create a new role. Enter a name for the role, such as `lambda-datadog-post-execution`.
  7.  Select **AWS Lambda** from the AWS Service Roles list. You do not need to attach any policies at this time. Press the appropriate buttons to complete the role creation.
  8.  Click on the role you just created. Expand the Inline Policies section and click the link to create a policy. Choose **Custom Policy** and press the button to continue.
  9.  Enter a policy name, such as `lambda-datadog-policy`. For Policy Document, enter the following, replacing &lt;ENCRYPTION_KEY ARN> with the ARN of the Encryption Key:

          {
              "Version": "2012-10-17",
              "Statement": [
                  {
                      "Effect": "Allow",
                      "Action": [
                          "kms:Decrypt"
                      ],
                      "Resource": [
                          "<ENCRYPTION_KEY ARN>"
                      ]
                  }
              ]
          }

  10. From the Lambda Management Console, create a new Lambda Function.
  11. On the Select blueprint screen, select the datadog-process-rds-metrics blueprint.
  12. Choose `RDSOSMetrics` from the **Log Group** dropdown.
  13. Enter anything for the Filter Name and click Next.
  13. Enter a name for your function, such as `lambda-datadog-post-function`.
  14. In the Lambda function code area, replace `<KMS_ENCRYPTED_KEYS>` with the ciphertext blob part of the CLI command output above.
  15. Under Lambda function handler and role, choose the role you created above. Click **Next**.
  16. Choose the **Enable Now** radio button.
  17. Click the **Create Function** button.


* **Native Database Integration**

  1.  Navigate to the AWS Console and open the RDS section to find the instance you want to monitor.
      ![][1]
  2.  Copy the endpoint URL (e.g. **mysqlrds.blah.us-east1.rds.amazonaws.com:3306**); You will need it when you configure the agent. Also make a note of the `DB Instance identifier` (e.g. **mysqlrds**). You will need it to create graphs and dashboards. -->

# インストール

* **標準的な RDS インテグレーション**

  標準的な RDS インテグレーションには、 Datadog Agent などの他のアプリケーションのインストールは不要です。

* **エンハンスド RDS インテグレーション**

  1. RDS インスタンスに対しエンハンスド モニタリングを有効にします。この操作は、インスタンスの作成時又は、作成後に可能です。インスタンス作成後にこの操作をする場合は、 **Instance Actions** の **Modify** を選択します。監視の時間の粒度には 15 秒を選択することをお勧めします。

      ![][4]

  2. IAM のマネージメント コンソールから、 **Encryption Keys** をクリックし、次に **Create Key** をクリックします。　

  3. `lambda-datadog-key` の名前で、そのキーのエリアスを入力します。

  4. 適切な管理者を追加し、次にそのユーザのキーを追加します。少なくともユーザとして自分自身を選択してください。

  5. 先に作成したキーを、[AWS CLI][5] を使って暗号化します:

          aws kms encrypt --key-id alias/<KMS key name> --plaintext '{"api_key":"<datadog_api_key>", "app_key":"<datadog_app_key>"}'

      `<KMS key name>`の部分は、作成したばかりのエイリアスのキー名に置き換えてください。`<datadog_api_key>` と `<datadog_app_key>` は、 Datadog サイトの[APIs][6] ページに表示されているものと置き換えてください。

      The output of this command will include two parts: a ciphertext blob followed by the key ID that starts with something similar to **arn:aws:kms**.

      このコマンドの出力には、二つの部分が含まれています: 暗号文 blob とそれに続いて **arn:aws:kms** 出始まるキー ID になります。

  6. IAM 管理コンソールから、新しいロールを作成します。`lambda-datadog-post-execution` のようなロール名を入力してください。

  7. "AWS サービス ロール" のリストから ** AWS Lambda ** を選択します。この時点で、ロールにポリシをアタッチする必要はありません。"Create Role" のボタンを押してロール作成を完了します。

  8. 作成したばかりの role をクリックします。"Inline Policies" セクションを展開して、ポリシを作成するために "click here" をクリックして遷移します。遷移先のページで、**Custom Policy** を選択し、 "Select" ボタンをクリックします。

  9. `lambda-datadog-policy`のようなポリシー名を入力します。 "Policy Document" には、次の内容を入力します。 `<ENCRYPTION_KEY ARN>` の部分は、暗号化キーの ARN で置き換えます:

          {
              "Version": "2012-10-17",
              "Statement": [
                  {
                      "Effect": "Allow",
                      "Action": [
                          "kms:Decrypt"
                      ],
                      "Resource": [
                          "<ENCRYPTION_KEY ARN>"
                      ]
                  }
              ]
          }

  10. Lambda の管理コンソールで、"create Lambda function" をクリックします。

  11. ブループリントのページで `datadog-process-rds-metrics` のブループリントを選択します。

  12. **Log Group** のプルダウンで、 `RDSOSMetrics` を選択します。

  13. "Filter Name" に何かを入力し、"Next" をクリックします。

  14. `lambda-datadog-post-function` のようなファンクションの名前を入力します。

  15. 先の "Lambda function code" のエリアの `<KMS_ENCRYPTED_KEYS>` を、先の CLI コマンド出力の暗号文 blob 部分で置き換えます。

  16. "Lambda function handler and role" の項目で、先に作ったロールを選択し、**Next**をクリックします。　

  17. **Enable Now** ラジオ ボタンを選択します。

  18. **Create Function** ボタンをクリックします。

* **RDS + ネイティブ データベース インテグレーション**

  1. AWS コンソールに移動し、 RDS セクションを開いて、監視したいインスタンスを見つけ出します。

      ![][1]

  2. エンド ポイントの URL をコピーします。 (例: **mysqlrds.blah.us-east1.rds.amazonaws.com:3306**) このエンド ポイント URL の情報は、 Agent の設定に必要になります。又、`DB Instance identifier` (例: **mysqlrds**) も記録しておいてください。メトリクスの収集が始まった後に、Datadog 上でグラフやダッシュボードを作成する際に、この情報を使うことがあります。

<!-- # Configuration

* **Standard RDS Integration**

  1.  Ensure RDS is checked in the AWS Integration tile.

* **Enhanced RDS Integration**

  1.  Ensure RDS is checked in the AWS Integration tile.

* **Native Database Integration**

  1.  Configure an agent and connect to your RDS instance by editing the appropriate yaml file in your conf.d directory.
      a.  If you are using MySQL, MariaDB, or Aurora, then edit mysql.yaml:

          init_config:

          instances:
            - server: mysqlrds.blah.us-east1-rds.amazonaws.com # The endpoint URL from the AWS console
              user: my_username
              pass: my_password
              port: 3306
              tags:
                - dbinstanceidentifier:my_own_instance
      {:.language-yaml}

      b.  If you are using PostgreSQL, then edit postgres.yaml:

          init_config:

          instances:
            - host: mysqlrds.blah.us-east1-rds.amazonaws.com
              port: 5432
              username: my_username
              password: my_password
              dbname: db_name
              tags:
                - dbinstanceidentifier:my_own_instance
      {:.language-yaml}

      c.  If you are using Microsoft SQL Server, then edit sqlserver.yaml

          init_config:

          instances:
            - host: mysqlrds.blah.us-east1-rds.amazonaws.com,1433
              username: my_username
              password: my_password
              tags:
                - dbinstanceidentifier:my_own_instance
      {:.language-yaml}

  2.  Restart the agent. -->

# 設定

* **エンハンスド RDS インテグレーション**

  1. AWS サービス インテグレーションのタイルを展開し、左側コラムで RDS にチェックが入っていることを確認します。

* **エンハンスド RDS インテグレーション**

  1. AWS サービス インテグレーションのタイルを展開し、左側コラムで RDS にチェックが入っていることを確認します。

* **RDS + ネイティブ データベース インテグレーション**

  1. conf.d ディレクトリ以下にある該当 yaml ファイルを編集し、 Agent が RDS インスタンスに接続できるように設定します。

      a. MySQL, MariaDB, Aurora を使用している場合は、 mysql.yaml を編集します:

          init_config:

          instances:
            - server: mysqlrds.blah.us-east1-rds.amazonaws.com # The endpoint URL from the AWS console
              user: my_username
              pass: my_password
              port: 3306
              tags:
                - dbinstanceidentifier:my_own_instance
      {:.language-yaml}

      b. PostgreSQL を使用している場合は、 postgres.yaml を編集します:

          init_config:

          instances:
            - host: mysqlrds.blah.us-east1-rds.amazonaws.com
              port: 5432
              username: my_username
              password: my_password
              dbname: db_name
              tags:
                - dbinstanceidentifier:my_own_instance
      {:.language-yaml}

      c. Microsoft SQL Server を使用している場合は、 sqlserver.yaml を編集します:

          init_config:

          instances:
            - host: mysqlrds.blah.us-east1-rds.amazonaws.com,1433
              username: my_username
              password: my_password
              tags:
                - dbinstanceidentifier:my_own_instance
      {:.language-yaml}

  2. Agent を再起動します。


<!-- # Validation

To validate that the native database integration is working, run `datadog-agent info`. You should see something like the following:

    Checks
    ======

      [...]

      mysql
      -----
          - instance #0 [OK]
          - Collected 8 metrics & 0 events -->

# 動作確認

ネイティブ データベース インテグレーションが動作していることを確認するには、 `datadog-agent info` を実行してください。 設定した yaml ファイルと名前の項目で、収集しているメトリクス数とイベントの数が表示されます:

    Checks
    ======

      [...]

      mysql
      -----
          - instance #0 [OK]
          - Collected 8 metrics & 0 events


<!-- # Usage

After a few minutes, RDS metrics and metrics from MySQL, Aurora, MariaDB, SQL Server, or PostgreSQL will be accessible in Datadog in the Metrics Explorer, in Graphs and in Alerts. Here's an example of an Aurora dashboard displaying a number of metrics from both RDS and the MySQL integration. Metrics from both integrations on the instance `quicktestrds` are unified using the `dbinstanceidentifier` tag. ![][2]

Here is the default dashboard for MySQL on Amazon RDS:
![RDS MySQL default dashboard](/static/images/rds-mysql.png)

Learn more about how to monitor MySQL on Amazon RDS performance metrics thanks to [our series of posts](https://www.datadoghq.com/blog/monitoring-rds-mysql-performance-metrics/). We detail the key performance metrics, how to collect them, and how to use Datadog to monitor MySQL on Amazon RDS. -->

# 使用方法

数分後、 MySQL, Aurora, MariaDB, SQL Server, PostgreSQL のメトリクスと RDS メトリクスは、 Datadog のMetrics Explorer で閲覧し、 グラフやアラートなどで利用できるようになります。以下は、 RDS と MySQL インテグレーション からのメトリクスを表示する Aurora ダッシュボードの例です。このインスタンスに付いて、両方のインテグレーションから受信しているメトリクスは、 `quicktestrds` タグによりマッチングをしています。このマッチングには、`dbinstanceidentifier` タグを使用しています。

![][2]

以下は、Amazon RDS 上の MySQL のデフォルト ダッシュボードになります:

![RDS MySQL default dashboard](/static/images/rds-mysql.png)

Amazon RDS 上の MySQL のパフォーマンス メトリクスを監視する方法の詳細については、["Monitoring RDS MySQL performance metrics"](ttps://www.datadoghq.com/blog/monitoring-rds-mysql-performance-metrics/) 及びそのシリーズのブログ記事を参照してください。この記事では、主要なパフォーマンス メトリクス、収集方法、 Datadog を使用して Amazon RDS 上の MySQL を監視する方法について詳しく説明しています。


<!-- # Metrics

In addition to the metrics you get from the database engines you will also get the following RDS metrics:

<%= get_metrics_from_git()%> -->

# メトリクス

データベース エンジンから取得したメトリクスに加えて、次の Amazon CloudWatch 経由で以下の RDS メトリクスも取得します:

<%= get_metrics_from_git()%>


   [1]: /static/images/rds-console.png
   [2]: /static/images/aurora-rds-dash.png
   [3]: mailto:support@datadoghq.com
   [4]: /static/images/rds-enhanced-install.png
   [5]: http://aws.amazon.com/documentation/cli/
   [6]: https://app.datadoghq.com/account/settings#api
