---
last_modified: 2017/03/07
translation_status: complete
language: ja
title: Datadog-AWS インテグレーション
integration_title: Amazon Web Services
kind: integration
newhlevel: true
git_integration_title: amazon_web_services
---

<!-- # Overview

Connect to Amazon Web Services (AWS) in order to:

* See automatic AWS status updates in your stream
* Get CloudWatch metrics for EC2 hosts without installing the Agent
* Tag your EC2 hosts with EC2-specific information (e.g. availability zone)
* Get CloudWatch metrics for other services: ELB, RDS, EBS, AutoScaling, DynamoDB, ElastiCache, CloudFront, CloudSearch, Kinesis, Lambda, OpsWorks, Redshift, Route53, SQS, and SNS
* See EC2 scheduled maintenances events in your stream -->

# 概 要

以下の内容を実現するために、Amazon Web Services (AWS)からデータを集取できるようにします:

* AWS 内で自動実行されている操作のステータスアップデートをイベントストリーム内に表示できるようにします。
* Agent を入れ低な状態でも、 EC2 ホストから CloudWatch メトリクスを集取できるようにします。
* EC2 ホストに対し EC2 特有の情報をタグとして付与することができるようにします。( "availability zone" など)
* ELB, RDS, EBS, AutoScaling, DynamoDB, ElastiCache, CloudFront, CloudSearch, Kinesis, Lambda, OpsWorks, Redshift, Route53, SQS, SNS などの、他の AWS サービスの CloudWatch メトリクスを収集できるようにします。
* EC2 のスケジュールメンテナンス作業の発生イベントをイベントストリーム内に表示できるようにします。

<!-- Related integrations include:

| [Billing](/integrations/awsbilling) | billing and budgets |
| [CloudTrail](/integrations/awscloudtrail) | Access to log files and AWS API calls |
| [Dynamo DB](/integrations/awsdynamo) | NoSQL Database|
| [Elastic Beanstalk](/integrations/awsbeanstalk) | easy-to-use service for deploying and scaling web applications and services |
| [Elastic Cloud Compute (EC2)](/integrations/awsec2) | resizable compute capacity in the cloud |
| [ElastiCache](/integrations/awselasticache) | in-memory cache in the cloud |
| [Elastic Load Balancing (ELB)](/integrations/awselb) | distributes incoming application traffic across multiple Amazon EC2 instances |
| [EC2 Container Service (ECS)](/integrations/ecs) | container management service that supports Docker containers |
| [Elasticsearch Service (ES)](/integrations/awses) |  deploy, operate, and scale Elasticsearch clusters |
| [Kinesis](/integrations/awskinesis) | service for real-time processing of large, distributed data streams |
| [Relational Database Service (RDS)](/integrations/awsrds) | relational database in the cloud |
| [Route 53](/integrations/awsroute53) | DNS and traffic management with availability monitoring |
| [Simple Email Service (SES)](/integrations/awsses) | cost-effective, outbound-only email-sending service |
| [Simple Notification System (SNS)](/integrations/awssns) | alert and notifications |
| [Simple Queue Service (SQS)](/integrations/awssqs) | messaging queue service |
| [Simple Storage Service (S3)](/integrations/awss3) | highly available and scalable cloud storage service |
{:.table} -->

関連しているAWS系サービスのインテグレーションは以下になります:

| [Billing](/ja/integrations/awsbilling) | billing and budgets |
| [CloudTrail](/ja/integrations/awscloudtrail) | Access to log files and AWS API calls |
| [Dynamo DB](/ja/integrations/awsdynamo) | NoSQL Database|
| [Elastic Beanstalk](/ja/integrations/awsbeanstalk) | easy-to-use service for deploying and scaling web applications and services |
| [Elastic Cloud Compute (EC2)](/ja/integrations/awsec2) | resizable compute capacity in the cloud |
| [ElastiCache](/ja/integrations/awselasticache) | in-memory cache in the cloud |
| [Elastic Load Balancing (ELB)](/ja/integrations/awselb) | distributes incoming application traffic across multiple Amazon EC2 instances |
| [EC2 Container Service (ECS)](/ja/integrations/ecs) | container management service that supports Docker containers |
| [Elasticsearch Service (ES)](/ja/integrations/awses) |  deploy, operate, and scale Elasticsearch clusters |
| [Kinesis](/ja/integrations/awskinesis) | service for real-time processing of large, distributed data streams |
| [Relational Database Service (RDS)](/ja/integrations/awsrds) | relational database in the cloud |
| [Route 53](/ja/integrations/awsroute53) | DNS and traffic management with availability monitoring |
| [Simple Email Service (SES)](/ja/integrations/awsses) | cost-effective, outbound-only email-sending service |
| [Simple Notification System (SNS)](/ja/integrations/awssns) | alert and notifications |
| [Simple Queue Service (SQS)](/ja/integrations/awssqs) | messaging queue service |
| [Simple Storage Service (S3)](/ja/integrations/awss3) | highly available and scalable cloud storage service |
{:.table}


<!-- There are a number of other AWS services that are also available in Datadog but they are all configured in the main AWS Integration or in the CloudTrail integration. This includes, but is not limited to:

| AutoScaling |
| Budgeting |
| CloudFront |
| CloudSearch |
| EBS |
| Elastic MapReduce |
| Firehose |
| Lambda |
| MachineLearning |
| OpsWorks |
| Simple Workflow Service |
| Trusted Advisor |
| WorkSpaces |
{:.table} -->

上記以外にも Datadog と連携することができる他の AWS サービスがあります。それらのサービスについては、AWS インテグレーションまたは CloudTrail インテグレーション出設定することができます。現状では以下がそれらの他の AWS サービスになります。これらは状況にあわせて順次追加されます:

| AutoScaling |
| Budgeting |
| CloudFront |
| CloudSearch |
| EBS |
| Elastic MapReduce |
| Firehose |
| Lambda |
| MachineLearning |
| OpsWorks |
| Simple Workflow Service |
| Trusted Advisor |
| WorkSpaces |
{:.table}


<!-- # Installation

Setting up the Datadog integration with Amazon Web Services requires configuring role delegation using AWS IAM. To get a better
understanding of role delegation, refer to the [AWS IAM Best Practices guide](http://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#delegate-using-roles).

Note: The GovCloud and China regions do not currently support IAM role delegation. If you are deploying in these regions please skip to the [configuration section](#configuration-for-china-and-govcloud) below. -->

# インストール

Amazon Web Services 用のインテグレーションを導入するには、AWS IAM を使用してロール委任を設定する必要があります。
ロール委任の機能をよりよく理解するには、AWS が公開している [IAM  のベストプラクティス](http://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/best-practices.html#delegate-using-roles)を参照してください。

注: 現状、GovCloud と中国リージョンでは、AWS IAM のロール委任機能がサポートされていません。 これらのリージョンに対してインテグレーションを設定しようとしている場合は、[GovCloud と中国リージョンでの設定](#configuration-for-china-and-govcloud)のセクションへ進んでください。


<!-- 1.  First create a new policy in the [IAM Console](https://console.aws.amazon.com/iam/home#s=Home). Name the policy `DatadogAWSIntegrationPolicy`, or choose a name that is more relevant for you. To take advantage of every AWS integration offered by Datadog, using the following in the **Policy Document** textbox. As we add other components to the integration, these permissions may change.

        {
          "Version": "2012-10-17",
          "Statement": [
            {
              "Action": [
                "autoscaling:Describe*",
                "budgets:ViewBudget",
                "cloudtrail:DescribeTrails",
                "cloudtrail:GetTrailStatus",
                "cloudwatch:Describe*",
                "cloudwatch:Get*",
                "cloudwatch:List*",
                "dynamodb:list*",
                "dynamodb:describe*",
                "ec2:Describe*",
                "ec2:Get*",
                "ecs:Describe*",
                "ecs:List*",
                "elasticache:Describe*",
                "elasticache:List*",
                "elasticloadbalancing:Describe*",
                "elasticmapreduce:List*",
                "elasticmapreduce:Describe*",
                "es:ListTags",
                "es:ListDomainNames",
                "es:DescribeElasticsearchDomains",
                "kinesis:List*",
                "kinesis:Describe*",
                "logs:Get*",
                "logs:Describe*",
                "logs:FilterLogEvents",
                "logs:TestMetricFilter",
                "rds:Describe*",
                "rds:List*",
                "route53:List*",
                "s3:GetBucketTagging",
                "s3:ListAllMyBuckets",
                "ses:Get*",
                "sns:List*",
                "sns:Publish",
                "sqs:ListQueues",
                "support:*"
              ],
              "Effect": "Allow",
              "Resource": "*"
            }
          ]
        }

     If you are not comfortable with granting all of these permissions, at the very least use the existing policies named **AmazonEC2ReadOnlyAccess** and **CloudWatchReadOnlyAccess**. For more detailed information regarding permissions, please see the [Permissions](#permissions) section below.

2.  Create a new role in the IAM Console. Name it anything you like, such as `DatadogAWSIntegrationRole`.
3.  From the selection, choose Role for Cross-Account Access.
4.  Click the Select button for **Allows IAM users from a 3rd party AWS account to access this account**.
5.  For Account ID, enter `464622532012` (Datadog's account ID). This means that you will grant Datadog and Datadog only read access to your AWS data. For External ID, enter the one generated on our website. Make sure you leave **Require MFA** disabled. *For more information about the External ID, refer to [this document in the IAM User Guide](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html)*.
6.  Select the policy you created above.
7.  Review what you selected and click the **Create Role** button.

-->

1. まず、 [IAM コンソール][1]に移動し、新しいポリシーを作成します。 その新しく作ったポリシーを` DatadogAWSIntegrationPolicy` として登録します。ここで設定する名前は自由です選択することができます。 Datadog が提供するすべての AWS 系インテグレーションを活用するには、次に紹介する JSON の内容を使ってください。尚、 AWS 系インテグレーションに新コンポーネントを追加する際に、アクセス許可の項目が変更されることがあります。

        {
          "Version": "2012-10-17",
          "Statement": [
            {
              "Action": [
                "autoscaling:Describe*",
                "budgets:ViewBudget",
                "cloudtrail:DescribeTrails",
                "cloudtrail:GetTrailStatus",
                "cloudwatch:Describe*",
                "cloudwatch:Get*",
                "cloudwatch:List*",
                "dynamodb:list*",
                "dynamodb:describe*",
                "ec2:Describe*",
                "ec2:Get*",
                "ecs:Describe*",
                "ecs:List*",
                "elasticache:Describe*",
                "elasticache:List*",
                "elasticloadbalancing:Describe*",
                "elasticmapreduce:List*",
                "elasticmapreduce:Describe*",
                "es:ListTags",
                "es:ListDomainNames",
                "es:DescribeElasticsearchDomains",
                "kinesis:List*",
                "kinesis:Describe*",
                "logs:Get*",
                "logs:Describe*",
                "logs:FilterLogEvents",
                "logs:TestMetricFilter",
                "rds:Describe*",
                "rds:List*",
                "route53:List*",
                "s3:GetBucketTagging",
                "s3:ListAllMyBuckets",
                "ses:Get*",
                "sns:List*",
                "sns:Publish",
                "sqs:ListQueues",
                "support:*"
              ],
              "Effect": "Allow",
              "Resource": "*"
            }
          ]
        }

今回紹介した権限をすべて付与することに不安がある場合は、、少なくとも `AmazonEC2ReadOnlyAccess` と `CloudWatchReadOnlyAccess` という既存のポリシーを付与してください。各 AWS 系インテグレーションが必要としている権限の詳細については、下記の[権限](#permissions)セクションを参照してください。

2. IAMコンソールで新しいロールを作成します。新しく作ったロールに `DatadogAWSIntegrationRole` のような名前を付けます。
3. "ロールタイプの選択"のページで、`クロスアカウントアクセスのロール`を選択します。
4. "AWS アカウントとサードパーティ AWS アカウント間のアクセス権を提供します" の右にある"選択"ボタンをクリックします。
5. 「アカウント ID」に`464622532012`（Datadogのアカウント ID）と入力します。このアカウントIDを入力することで、 AWS が提供しているデータへ Datadog が読み取りのみの権限範囲でアクセスすることを許可します。「外部 ID」には、Datadog の[AWSインテグレーションタイル](https://app.datadoghq.com/account/settings#integrations/amazon_web_services)内に表示された "AWS External ID" を入力します。尚、 MFA の使用は、無効にしたままにしておいてください。外部 ID の詳細については、[「IAM ユーザーガイド」](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html)のドキュメントを参照してください。
6. 上記で作成したポリシー(例: `DatadogAWSIntegrationPolicy` )を選択します。
7. 選択した内容を確認し、**ロールの作成**ボタンをクリックします。


<!-- # Configuration

![logo](/static/images/integrations-aws-secretentry.png)

1.  Open the [AWS Integration tile](https://app.datadoghq.com/account/settings#integrations/amazon_web_services).
2.  Select the **Role Delegation** tab.
3.  Enter your AWS Account ID which can be found in the ARN of the newly created role. Then enter the name of the role you just created. Finally enter the External ID you specified above.
4.  Choose the services you want to collect metrics for on the left side of the dialog. You can optionally add tags to all hosts and metrics. Also if you want to only monitor a subset of EC2 instances on AWS, tag them and specify the tag in the limit textbox here.
5.  Click **Install Integration**. -->

# 設定

![logo](/static/images/integrations-aws-secretentry.png)

1. [AWS インテグレーション](https://app.datadoghq.com/account/settings#integrations/amazon_web_services)のタイルを表示します。
2. **Role Delegation** のタブを選択します。
3. 新たに作成したロールの ARN にある AWS アカウント ID を入力します。 次に、そのロールの名前を入力します。 最後に、上記で指定した外部 ID を入力します。
4. 設定画面の左側で、メトリックを収集するサービスを選択します。 オプションで、すべてのホストとメトリックにタグを追加できます。 また、AWS 上の EC2 インスタンスのサブセットのみを監視する場合は、それらの EC2 インスタンスにタグを付与し、 "Optionaly limit metircs collection" ボックスでそにタグを指定します。 
5. **Install Integration** をクリックします。


<!-- ## Configuration for China and GovCloud

1.  Open the [AWS Integration tile](https://app.datadoghq.com/account/settings#integrations/amazon_web_services).
2.  Select the **Access Keys (GovCloud or China Only)** tab.
3.  Enter your AWS Access Key and AWS Secret Key. Note: only access and secret keys for China and GovCloud are accepted.
4.  Choose the services you want to collect metrics for on the left side of the dialog. You can optionally add tags to all hosts and metrics. Also if you want to only monitor a subset of EC2 instances on AWS, tag them and specify the tag in the limit textbox here.
5.  Click **Install Integration**. -->

## GovCloud と中国リージョンでの設定

1. [AWS インテグレーション](https://app.datadoghq.com/account/settings#integrations/amazon_web_services)のタイルを表示します。
2. **Access Keys (GovCloud と中国リージョンのみ)**を選択します。
3. AWS Access Key と AWS Secret Key を入力します。 注: GovCloud と中国リージョンの access key と secret key が受け付けられます。
4. 設定画面の左側で、メトリックを収集するサービスを選択します。 オプションで、すべてのホストとメトリックにタグを追加できます。 また、AWS 上の EC2 インスタンスのサブセットのみを監視する場合は、それらの EC2 インスタンスにタグを付与し、 "Optionaly limit metircs collection" ボックスでそにタグを指定します。 
5. **Install Integration** をクリックします。


<!-- # Metrics

<%= get_metrics_from_git() %> -->

# メトリックス

<%= get_metrics_from_git() %>


<!-- ##  Permissions

The core Datadog-AWS integration pulls data from AWS CloudWatch. At a minimum, your Policy Document will need to allow the following actions:

* `cloudwatch:ListMetrics` to list the available CloudWatch metrics.
* `cloudwatch:GetMetricStatistic` to fetch data points for a given metric.

Note that these actions and the ones listed below are included in the Policy Document using wild cards such as `List*` and `Get*`. If you require strict policies, please use the complete action names as listed and reference the Amazon API documentation for the services you require.

By allowing Datadog to read the following additional endpoints, the AWS integration will be able to add tags to CloudWatch metrics and generate additional metrics. -->

##  Permissions

Datadog-AWS インテグレーションのコアプログラムは、AWS CloudWatch からデータを取得します。 最低でも、ポリシー文書では次の操作を許可する必要があります:

* `cloudwatch:ListMetrics` to list the available CloudWatch metrics.
* `cloudwatch:GetMetricStatistic` to fetch data points for a given metric.

注: Policy Document 上の "List", "Get" アクションについては、 `List*` や `Get*` のようなワイルドカードを使って複数を同時に指定することができます。厳格なポリシー設定が必要な場合は、各 AWS サービスの Amazon API ドキュメントを参照し、完全なアクション名を指定してください。

次の追加エンドポイントを Datadog が読み取れるようにすることで、 AWS インテグレーションは CloudWatch メトリックにタグを追加したり、追加のメトリックを生成することができるようになります。


<!-- ## Autoscaling

* `autoscaling:DescribeAutoScalingGroups`: Used to list all autoscaling groups.
* `autoscaling:DescribePolicies`: List available policies (for autocompletion in events and monitors).
* `autoscaling:DescribeTags`: Used to list tags for a given autoscaling group. This will add ASG custom tags on ASG CloudWatch metrics.
* `autoscaling:DescribeScalingActivities`: Used to generate events when an ASG scales up or down.
* `autoscaling:ExecutePolicy`: Execute one policy (scale up or down from a monitor or the events feed). Note: This is not included in the [installation Policy Document](#installation) and should only be included if you are using monitors or events to execute an autoscaling policy.

For more information on [Autoscaling policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_application-autoscaling.html), review the documentation on the AWS website. -->

## Autoscaling

* `autoscaling:DescribeAutoScalingGroups`: Used to list all autoscaling groups.
* `autoscaling:DescribePolicies`: List available policies (for autocompletion in events and monitors).
* `autoscaling:DescribeTags`: Used to list tags for a given autoscaling group. This will add ASG custom tags on ASG CloudWatch metrics.
* `autoscaling:DescribeScalingActivities`: Used to generate events when an ASG scales up or down.
* `autoscaling:ExecutePolicy`: Execute one policy (scale up or down from a monitor or the events feed). Note: This is not included in the [installation Policy Document](#installation) and should only be included if you are using monitors or events to execute an autoscaling policy.

[Autoscaling ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_application-autoscaling.html)の詳細は、 AWS の web サイトを参照してください。

<!-- ## Billing

* `budgets:ViewBudget`: Used to view budget metrics

For more information on [Budget policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_budgets.html), review the documentation on the AWS website. -->

## Billing

* `budgets:ViewBudget`: Used to view budget metrics

[Budget ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_budgets.html)の詳細は、 AWS の web サイトを参照してください。

<!-- ## CloudTrail

* `cloudtrail:DescribeTrails`: Used to list trails and find in which s3 bucket they store the trails
* `cloudtrail:GetTrailStatus`: Used to skip inactive trails

For more information on [CloudTrail policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_cloudtrail.html), review the documentation on the AWS website.

CloudTrail also requires some s3 permissions to access the trails. **These are required on the CloudTrail bucket only**

* `s3:ListBucket`: List objects in the CloudTrail bucket to get available trails
* `s3:GetBucketLocation`: Get bucket's region to download trails
* `s3:GetObject`: Fetch available trails

For more information on [S3 policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_s3.html), review the documentation on the AWS website. -->

## CloudTrail

* `cloudtrail:DescribeTrails`: Used to list trails and find in which s3 bucket they store the trails
* `cloudtrail:GetTrailStatus`: Used to skip inactive trails

[CloudTrail ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_cloudtrail.html) の詳細は、 AWS の web サイトを参照してください。

CloudTrail を有効にする場合、 trails にアクセスするために s3 権限が必要になります。**CloudTrail 用 bucketに対してのみ許可が必要です。**

* `s3:ListBucket`: List objects in the CloudTrail bucket to get available trails
* `s3:GetBucketLocation`: Get bucket's region to download trails
* `s3:GetObject`: Fetch available trails

[S3 ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_s3.html) の詳細は、 AWS の web サイトを参照してください。



<!-- ## DynamoDB

* `dynamodb:ListTables`: Used to list available DynamoDB tables.
* `dynamodb:DescribeTable`: Used to add metrics on a table size and item count.

For more information on [DynamoDB policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_dynamodb.html), review the documentation on the AWS website. -->

## DynamoDB

* `dynamodb:ListTables`: Used to list available DynamoDB tables.
* `dynamodb:DescribeTable`: Used to add metrics on a table size and item count.

[DynamoDB ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_dynamodb.html) の詳細は、 AWS の web サイトを参照してください。


<!-- ## EC2

* `ec2:DescribeInstanceStatus`: Used by the ELB integration to assert the health of an instance. Used by the EC2 integration to describe the health of all instances.
* `ec2:DescribeSecurityGroups`: Adds SecurityGroup names and custom tags to ec2 instances.
* `ec2:DescribeInstances`: Adds tags to ec2 instances and ec2 cloudwatch metrics.

For more information on [EC2 policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_ec2.html), review the documentation on the AWS website.
 -->

## EC2

* `ec2:DescribeInstanceStatus`: Used by the ELB integration to assert the health of an instance. Used by the EC2 integration to describe the health of all instances.
* `ec2:DescribeSecurityGroups`: Adds SecurityGroup names and custom tags to ec2 instances.
* `ec2:DescribeInstances`: Adds tags to ec2 instances and ec2 cloudwatch metrics.

[EC2 ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_ec2.html) の詳細は、 AWS の web サイトを参照してください。

<!-- ## ECS

* `ecs:ListClusters`: List available clusters.
* `ecs:ListContainerInstances`: List instances of a cluster.
* `ecs:DescribeContainerInstances`: Describe instances to add metrics on resources and tasks running, adds cluster tag to ec2 instances.

For more information on [ECS policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_ecs.html), review the documentation on the AWS website. -->

## ECS

* `ecs:ListClusters`: List available clusters.
* `ecs:ListContainerInstances`: List instances of a cluster.
* `ecs:DescribeContainerInstances`: Describe instances to add metrics on resources and tasks running, adds cluster tag to ec2 instances.

[ECS ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_ecs.html) の詳細は、 AWS の web サイトを参照してください。


<!-- ## Elasticache

* `elasticache:DescribeCacheClusters`: List and describe Cache clusters, to add tags and additional metrics.
* `elasticache:ListTagsForResource`: List custom tags of a cluster, to add custom tags.
* `elasticache:DescribeEvents`: Add events avout snapshots and maintenances.

For more information on [Elasticache policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_elasticache.html), review the documentation on the AWS website. -->

## Elasticache

* `elasticache:DescribeCacheClusters`: List and describe Cache clusters, to add tags and additional metrics.
* `elasticache:ListTagsForResource`: List custom tags of a cluster, to add custom tags.
* `elasticache:DescribeEvents`: Add events avout snapshots and maintenances.

[Elasticache ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_elasticache.html) の詳細は、 AWS の web サイトを参照してください。


<!-- ## ELB

* `elasticloadbalancing:DescribeLoadBalancers`: List ELBs, add additional tags and metrics.
* `elasticloadbalancing:DescribeTags`: Add custom ELB tags to ELB metrics.

For more information on [ELB policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_elasticloadbalancing.html), review the documentation on the AWS website.
 -->

## ELB

* `elasticloadbalancing:DescribeLoadBalancers`: List ELBs, add additional tags and metrics.
* `elasticloadbalancing:DescribeTags`: Add custom ELB tags to ELB metrics.

[ELB ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_elasticloadbalancing.html) の詳細は、 AWS の web サイトを参照してください。



<!-- ## EMR

* `elasticmapreduce:ListClusters`: List available clusters.
* `elasticmapreduce:DescribeCluster`: Add tags to CloudWatch EMR metrics.

For more information on [EMR policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_elasticmapreduce.html), review the documentation on the AWS website. -->

## EMR

* `elasticmapreduce:ListClusters`: List available clusters.
* `elasticmapreduce:DescribeCluster`: Add tags to CloudWatch EMR metrics.

[EMR ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_elasticmapreduce.html) の詳細は、 AWS の web サイトを参照してください。



<!-- ## ES

* `es:ListTags`: Add custom ES domain tags to ES metrics
* `es:ListDomainNames`: Add custom ES domain tags to ES metrics
* `es:DescribeElasticsearchDomains`: Add custom ES domain tags to ES metrics

For more information on [ES policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_es.html), review the documentation on the AWS website. -->

## ES

* `es:ListTags`: Add custom ES domain tags to ES metrics
* `es:ListDomainNames`: Add custom ES domain tags to ES metrics
* `es:DescribeElasticsearchDomains`: Add custom ES domain tags to ES metrics

[ES ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_es.html) の詳細は、 AWS の web サイトを参照してください。



<!-- ## Kinesis

* `kinesis:ListStreams`: List available streams.
* `kinesis:DescribeStreams`: Add tags and new metrics for kinesis streams.
* `kinesis:ListTagsForStream`: Add custom tags.

For more information on [Kinesis policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_kinesis.html), review the documentation on the AWS website. -->

## Kinesis

* `kinesis:ListStreams`: List available streams.
* `kinesis:DescribeStreams`: Add tags and new metrics for kinesis streams.
* `kinesis:ListTagsForStream`: Add custom tags.

[Kinesis ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_kinesis.html)  の詳細は、 AWS の web サイトを参照してください。



<!-- ## CloudWatch Logs

* `logs:DescribeLogGroups`: List available groups.
* `logs:DescribeLogStreams`: List available streams for a group.
* `logs:FilterLogEvents`: Fetch some specific log events for a stream to generate metrics.

For more information on [CloudWatch Logs policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_logs.html), review the documentation on the AWS website. -->

## CloudWatch Logs

* `logs:DescribeLogGroups`: List available groups.
* `logs:DescribeLogStreams`: List available streams for a group.
* `logs:FilterLogEvents`: Fetch some specific log events for a stream to generate metrics.

[CloudWatch Logs ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_logs.html) の詳細は、 AWS の web サイトを参照してください。



<!-- ## RDS

* `rds:DescribeDBInstances`: Descrive RDS instances to add tags.
* `rds:ListTagsForResource`: Add custom tags on RDS instances.
* `rds:DescribeEvents`: Add events related to RDS databases.

For more information on [RDS policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_rds.html), review the documentation on the AWS website. -->

## RDS

* `rds:DescribeDBInstances`: Descrive RDS instances to add tags.
* `rds:ListTagsForResource`: Add custom tags on RDS instances.
* `rds:DescribeEvents`: Add events related to RDS databases.

[RDS ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_rds.html) の詳細は、 AWS の web サイトを参照してください。



<!-- ## Route53

* `route53:listHealthChecks`: List available health checks.
* `route53:listTagsForResources`: Add custom tags on Route53 CloudWatch metrics.

For more information on [Route53 policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_route53.html), review the documentation on the AWS website. -->

## Route53

* `route53:listHealthChecks`: List available health checks.
* `route53:listTagsForResources`: Add custom tags on Route53 CloudWatch metrics.

[Route53 ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_route53.html) の詳細は、 AWS の web サイトを参照してください。


<!-- ## S3

* `s3:ListAllMyBuckets`: Used to list available buckets
* `s3:GetBucketTagging`: Used to get custom bucket tags

For more information on [S3 policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_s3.html), review the documentation on the AWS website. -->

## S3

* `s3:ListAllMyBuckets`: Used to list available buckets
* `s3:GetBucketTagging`: Used to get custom bucket tags

[S3 ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_s3.html) の詳細は、 AWS の web サイトを参照してください。

<!-- ## SES

* `ses:GetSendQuota`: Add metrics about send quotas.
* `ses:GetSendStatistics`: Add metrics about send statistics.

For more information on [SES policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_ses.html), review the documentation on the AWS website.
 -->

## SES

* `ses:GetSendQuota`: Add metrics about send quotas.
* `ses:GetSendStatistics`: Add metrics about send statistics.

[SES ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_ses.html) の詳細は、 AWS の web サイトを参照してください。


<!-- ## SNS

* `sns:ListTopics`: Used to list available topics.
* `sns:Publish`: Used to publish notifications (monitors or event feed).

For more information on [SNS policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_sns.html), review the documentation on the AWS website. -->

## SNS

* `sns:ListTopics`: Used to list available topics.
* `sns:Publish`: Used to publish notifications (monitors or event feed).

[SNS ポリシ](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_sns.html) の詳細は、 AWS の web サイトを参照してください。


<!-- ## Support

* `support:*`: Used to add metrics about service limits. Note: it requires full access because of [AWS limitations](http://docs.aws.amazon.com/IAM/latest/UserGuide/list_trustedadvisor.html) -->

## Support

* `support:*`: Used to add metrics about service limits. Note: it requires full access because of [AWS limitations](http://docs.aws.amazon.com/IAM/latest/UserGuide/list_trustedadvisor.html)


<!-- # Troubleshooting
{: #troubleshooting}

**Do you believe you're seeing a discrepancy between your data in CloudWatch and Datadog?**
{:#tshoot-discrepancy}

There are two important distinctions to be aware of:

  1. In AWS for counters, a graph that is set to 'sum' '1minute' shows the total number of occurrences in one minute leading up to that point, i.e. the rate per 1 minute. Datadog is displaying the raw data from AWS normalized to per second values, regardless of the timeframe selected in AWS, which is why you will probably see our value as lower.
  2. Overall, min/max/avg have a different meaning within AWS than in Datadog. In AWS, average latency, minimum latency, and maximum latency are three distinct metrics that AWS collects. When Datadog pulls metrics from AWS CloudWatch, we only get the average latency as a single time series per ELB. Within Datadog, when you are selecting 'min', 'max', or 'avg', you are controlling how multiple time series will be combined. For example, requesting `system.cpu.idle` without any filter would return one series for each host that reports that metric and those series need to be combined to be graphed. On the other hand, if you requested `system.cpu.idle` from a single host, no aggregation would be necessary and switching between average and max would yield the same result. -->

# トラブル シューティング
{: #troubleshooting}

**CloudWatch のデータと Datadog のデータに食い違いがあると思う。**


{:#tshoot-discrepancy}

注意すべき重要な二つの違いがあります:

  1. AWS のカウンタ値は、'sum', '1minute' に設定されたグラフは、その時点までの過去一分間の総発生数、つまり一分あたりの発生率を示しています。 Datadog では、AWS からの生データを秒単位の値に正規化して表示しています。その結果、 Datadog の値が、 AWS 値より低くなっていることが多いです。

  2. AWS と　Datadogとでは、 min/max/avg は異なる意味を持ちます。AWS 上では、"average latency", "minimum latency", "maximum latency" は、AWS が個別に収集している三つの異なるメトリクスなります。Datadog では、AWS CloudWatch から "average latency" の時系列データのみをELBごとに収集し、'min', 'max', 'avg' は、複数ある時系列データをどのように組み合わせるかを制御しています。「どのように組み合わせるかの制御」の例としては、インフラ全体に対して `system.cpu.idle` メトリックの時系列データを要求すると、そのメトリックをレポーティングしているホストごとに時系列データか返され、それらの時系列データを集約して一本の線を引く必要が出てきます。その際、どのような制御で、時系列データを集約したかにより最終的な線の値が変わってきます。 一方、単一ホストからの `system.cpu.idle`  メトリックを要求した場合、集約するは必要がないので、 'avg' と 'max' を切り替えても最終的な線の値は変化するこはありません。

<!-- 
**Metrics delayed?**
{:#tshoot-delay}

When using the AWS integration, we're pulling in metrics via the CloudWatch API. You may see a slight delay in metrics from AWS due to some constraints that exist for their API.

To begin, the CloudWatch API only offers a metric-by-metric crawl to pull data. The CloudWatch APIs have a rate limit that varies based on the combination of authentication credentials, region, and service. Metrics are made available by AWS dependent on the account level. For example, if you are paying for "detailed metrics" within AWS, they are available more quickly. This level of service for detailed metrics also applies to granularity, with some metrics being available per minute and others per five minutes.

On the Datadog side, we do have the ability to prioritize certain metrics within an account to pull them in faster, depending on the circumstances. Please contact [support@datadoghq.com][6] for more info on this.

To obtain metrics with virtually zero delay, we recommend installing the Datadog Agent on those hosts. We’ve
written a bit about this [here][7],  especially in relation to CloudWatch. -->

**Metrics delayed?**
{:#tshoot-delay}

When using the AWS integration, we're pulling in metrics via the CloudWatch API. You may see a slight delay in metrics from AWS due to some constraints that exist for their API.

To begin, the CloudWatch API only offers a metric-by-metric crawl to pull data. The CloudWatch APIs have a rate limit that varies based on the combination of authentication credentials, region, and service. Metrics are made available by AWS dependent on the account level. For example, if you are paying for "detailed metrics" within AWS, they are available more quickly. This level of service for detailed metrics also applies to granularity, with some metrics being available per minute and others per five minutes.

On the Datadog side, we do have the ability to prioritize certain metrics within an account to pull them in faster, depending on the circumstances. Please contact [support@datadoghq.com][6] for more info on this.

To obtain metrics with virtually zero delay, we recommend installing the Datadog Agent on those hosts. We’ve
written a bit about this [here][7],  especially in relation to CloudWatch.


<!-- **Missing metrics?**
{:#tshoot-missing}
CloudWatch's api returns only metrics with datapoints, so if for instance an ELB has no attached instances, it is expected not to see metrics related to this ELB in Datadog. -->

**Missing metrics?**
{:#tshoot-missing}
CloudWatch's api returns only metrics with datapoints, so if for instance an ELB has no attached instances, it is expected not to see metrics related to this ELB in Datadog.


<!-- **Wrong count of aws.elb.healthy_host_count?**
{:#tshoot-wrongcount}

When the Cross-Zone Load Balancing option is enabled on an ELB, all the instances attached to this ELB are considered part of all A-Zs (on CloudWatch’s side), so if you have 2 instances in 1a and 3 in ab, the metric will display 5 instances per A-Z.
As this can be counter-intuitive, we’ve added a new metric, aws.elb.host_count, that displays the count of healthy instances per AZ, regardless of if this Cross-Zone Load Balancing option is enabled or not.
This metric should have value you would expect. -->

**Wrong count of aws.elb.healthy_host_count?**
{:#tshoot-wrongcount}

When the Cross-Zone Load Balancing option is enabled on an ELB, all the instances attached to this ELB are considered part of all A-Zs (on CloudWatch’s side), so if you have 2 instances in 1a and 3 in ab, the metric will display 5 instances per A-Z.
As this can be counter-intuitive, we’ve added a new metric, aws.elb.host_count, that displays the count of healthy instances per AZ, regardless of if this Cross-Zone Load Balancing option is enabled or not.
This metric should have value you would expect.


<!-- **Duplicated hosts when installing the agent?**
{:#tshoot-duphosts}

When installing the agent on an aws host, you might see duplicated hosts on the infra page for a few hours if you manually set the hostname in the agent's configuration. This second host will disapear a few hours later, and won't affect your billing. -->

**Duplicated hosts when installing the agent?**
{:#tshoot-duphosts}

When installing the agent on an aws host, you might see duplicated hosts on the infra page for a few hours if you manually set the hostname in the agent's configuration. This second host will disapear a few hours later, and won't affect your billing.


   [1]: https://console.aws.amazon.com/iam/home#s=Home
   [2]: https://app.datadoghq.com/account/settings#integrations/amazon_web_services

   [6]: mailto:support@datadoghq.com
   [7]: http://www.datadoghq.com/blog/dont-fear-the-agent