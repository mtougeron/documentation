---
last_modified: 2017/03/22
translation_status: complete
language: ja
title: Datadog-AWS CloudTrail インテグレーション
integration_title: AWS CloudTrail
kind: integration
newhlevel: true
autotocdepth: 1
---

<!-- # Overview

AWS CloudTrail provides an audit trail for your AWS account. Datadog reads this audit trail and creates events you can search for in your stream and use for correlation on your dashboards. Here is an example of a CloudTrail event:

![](/static/images/cloudtrail_event.png)

For information about the rest of the AWS services, see the [AWS tile][1] -->

# 概要

AWS CloudTrail は、AWS アカウントの監査証跡を提供します。 Datadog はこの監査証跡を読み取りイベントを作成し、イベント ストリーム上で検索を可能にし、ダッシュボード上でメトリクスとの相関関係に使用できるようにします。 以下が、CloudTrail イベントの例です:

![](/static/images/cloudtrail_event.png)

残りの AWS サービスについては、 Datadog インテグレーション ページの [AWS タイル][j1]を参照してください。


<!-- # Installation

Configure CloudWatch on AWS and ensure that the policy you created has the equivalent of the **AWSCloudTrailReadOnlyAccess** policy assigned. The actions in that policy are **s3:ListBucket**, **s3:GetBucketLocation**, and **s3:GetObject**. Also ensure that the policy gives access to the S3 bucket you selected for the CloudTrail Trail. Here is an example policy to give access to an S3 bucket.


    { 
      "Version": "2012-10-17",
      "Statement": [
      {
        "Action": [
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:GetObject"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::your-s3-bucket-name",
          "arn:aws:s3:::your-s3-bucket-name/*"
        ]
      } ]
    }
{:.language-json} -->

# インストール

AWS 上で CloudWatch を設定し、作成したポリシに **AWSCloudTrailReadOnlyAccess** に相当するポリシが割り当てられていることを確認します。そのポリシには、**s3:ListBucket**, **s3:GetBucketLocation**, **s3:GetObject** のアクションが含まれています。 また、CloudTrail Trail の保存先として選択した S3 バケットにアクセスできるポリシを持っているか確認します。以下に、 S3 バケットへのアクセスを許可するポリシの設定例です。

    { 
      "Version": "2012-10-17",
      "Statement": [
      {
        "Action": [
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:GetObject"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::your-s3-bucket-name",
          "arn:aws:s3:::your-s3-bucket-name/*"
        ]
      } ]
    }
{:.language-json}


<!-- # Configuration

Open the AWS CloudTrail tile. The accounts you configured in the Amazon Web Services tile are shown here and you can choose what kinds of events will be collected by Datadog. If you would like to see other events that are not mentioned here, please reach out to [our support team][2].
 -->

# 設定

AWS CloudTrail タイルを開きます。 Amazon Web Services タイルで設定したアカウントがここに表示されます。 ここで、Datadog で収集するイベントの種類を選択していきます。 ここに表示されていないその他のイベントを集取したい場合は、[サポートチーム][j2]にお問い合わせください。


<!-- # Troubleshooting

## I don't see a CloudTrail tile or there are no accounts listed

You need to first configure the [Amazon Web Services tile][1]. Once you complete this, the CloudTrail tile will be available and configurable. -->

# トラブルシューティング

## CloudTrail タイルが表示されない、又はアカウントがリスト表示されていない

最初に [Amazon Web Services][j1] タイルを設定する必要があります。 この設定を完了すると、 CloudTrail タイルが表示され、設定が可能になります。


[1]: /integrations/aws
[2]: /help
[j1]: /ja/integrations/aws
[j2]: /ja/help
