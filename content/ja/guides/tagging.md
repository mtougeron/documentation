---
last_modified: 2017/03/01
translation_status: complete
language: ja
title: タグ付け機能に関するガイド
kind: guide
listorder: 12
---

<!-- ## Overview
Tagging is used throughout the Datadog product to make it easier to subset and query the machines and metrics that you have to monitor. Without the ability to assign and filter based on tags, finding the problems that exist in your environment and narrowing them down enough to discover the true causes would be extremely difficult. -->

## 概要

タグ付け機能は、 Datadog サービスの全体に共通して、簡単に監視対象のマシンやメトリックをグループ化したり、フィルタリングしたりするために使うことができる機能です。タグを割り当て、それを基にフィルタする機能がなければ、運用環境で発生している複数の問題の中から真の問題を絞り込むことは非常に難しい作業です。


<!-- ## How to assign tags
There are four primary ways to assign tags: inherited from the integration, in the configuration, in the UI, and using the API, though the UI and API only allow you to assign tags at the host level. The recommended method is to rely on the integration or via the configuration files.
 -->

## タグを割り当てる方法

タグを割り当てるには、主に4つの方法があります:

  1. インテグレーションからの継承
  2. datadog.conf やインテグレーション内の YAML 設定ファイルへの記述
  3. UI から設定
  4. API のオプション項目の設定 (ホスト レベルでの、タグを割り当になります)

推奨される方法は、インテグレーションからの継承か datadog.conf から設定する方法です。


<!-- ### Inheriting tags from an integration

The easiest method for assigning tags is to rely on the integration. Tags assigned to your Amazon Web Services instances, Chef recipes, Docker labels, and more are all automatically assigned to the hosts and metrics when they are brought in to Datadog. -->

### インテグレーションからタグを継承する

タグを割り当てる最も簡単な方法は、インテグレーションに依存することです。 Amazon Web Services インスタンス, Chef のレシピ,  Docker ラベル, その他、事前に割り当てたタグは、監視情報(ホスト、メトリック、イベントなど)が、 Datadog へ到達した時点で自動的に割り当てられます。


<!-- The following integration sources create tags automatically in Datadog:

| Amazon CloudFront | Distribution |
| Amazon EC2 | AMI, Customer Gateway, DHCP Option, EBS Volume, Instance, Internet Gateway, Network ACL, Network Interface, Reserved Instance, Reserved Instance Listing, Route Table , Security Group - EC2 Classic, Security Group - VPC, Snapshot, Spot Batch, Spot Instance Request, Spot Instances, Subnet, Virtual Private Gateway, VPC, VPN Connection |
| Amazon Elastic File System | Filesystem |
| Amazon Kinesis | Stream State |
| Amazon Machine Learning | BatchPrediction, DataSource, Evaluation  , MLModel |
| Amazon Route 53 | Domains, Healthchecks  , HostedZone |
| Amazon WorkSpaces| WorkSpaces |
| AWS CloudTrail | CloudTrail |
| AWS Elastic Load Balancing| Loadbalancer, TargetGroups |
| AWS Identity and Access Management | Profile Name |
| AWS SQS | Queue Name |
| Apache | Apache Host and Port |
| Azure | Tenant Name, Status, Tags, Subscription ID and Name, Availability Zone in common with AWS tag after contacting Datadog support |
| BTRFS | Usage & Replication Type |
| Chef | Chef Roles |
| Consul | Previous and Current Consul Leaders and Followers, Consul Datacenter,  Service Name, Service ID |
| CouchDB | Database Name,  Instance Name |
| CouchBase | CouchBase Tags,  Instance Name |
| Docker | Docker Container and Image Name, Container Command, Container Labels |
| Dyn | Zone, Record Type |
| Elasticsearch | Cluster Name,  Host Name, Port Number  |
| Etcd | State Leader or Follower |
| Fluentd | Host Name, Port Number |
| Google App Engine | Project Name, Version ID, Task Queue |
| Google Cloud Platform | Zone, Instance Type and ID, Automatic Restart, Project Name and ID, Name, Availability Zone in common with AWS tag after contacting Datadog support |
| Go Expvar | Expvar Path |
| Gunicorn | State Idle or Working, App Name |
| HAProxy | Service Name, Availability, Backend Host, Status, Type |
| HTTP Check | URL, Instance |
| IIS | Site |
| Jenkins | Job Name, Build Number, Branch, and Results |
| JMX | JMX Tags |
| Kafka | Topic |
| Kubernetes | Minion Name, Namespace, Replication Controller, Labels, Container Alias |
| Marathon | URL |
| Memcached | Host, Port,  Request, Cache Hit or Miss |
| Mesos | Role, URL, PID, Slave or Master Role, Node, Cluster,   |
| Mongo | Server Name |
| OpenStack | Network ID, Network Name, Hypervisor Name, ID, and Type, Tenant ID,  Availability Zone |
| PHP FPM | Pool Name |
| Pivotal | Current State, Owner, Labels, Requester, Story Type |
| Postfix | Queue, Instance |
| * Puppet | Puppet Tags |
| RabbitMQ | Node, Queue Name, Vhost, Policy, Host |
| Redis | Host, Port,  Slave or Master |
| RiakCS | Aggregation Key |
| SNMP | Device IP Address |
| Supervisord | Server Name, Process Name |
| TeamCity | Tags, Code Deployments, Build Number |
| TokuMX | Role Primary or Secondary, Replset, Replstate, Db, Coll, Shard |
| Varnish | Name, Backend |
| VSphere | Host, Datacenter, Server, Instance |
| Win32 Events | Event ID |
| Windows Services | Service Name |
{: .table} -->

次のインテグレーションは、タグ情報を継承し自動的で割り当てます:

| Amazon CloudFront | Distribution |
| Amazon EC2 | AMI, Customer Gateway, DHCP Option, EBS Volume, Instance, Internet Gateway, Network ACL, Network Interface, Reserved Instance, Reserved Instance Listing, Route Table , Security Group - EC2 Classic, Security Group - VPC, Snapshot, Spot Batch, Spot Instance Request, Spot Instances, Subnet, Virtual Private Gateway, VPC, VPN Connection |
| Amazon Elastic File System | Filesystem |
| Amazon Kinesis | Stream State |
| Amazon Machine Learning | BatchPrediction, DataSource, Evaluation  , MLModel |
| Amazon Route 53 | Domains, Healthchecks  , HostedZone |
| Amazon WorkSpaces| WorkSpaces |
| AWS CloudTrail | CloudTrail |
| AWS Elastic Load Balancing| Loadbalancer, TargetGroups |
| AWS Identity and Access Management | Profile Name |
| AWS SQS | Queue Name |
| Apache | Apache Host and Port |
| Azure | Tenant Name, Status, Tags, Subscription ID and Name, Availability Zone in common with AWS tag after contacting Datadog support |
| BTRFS | Usage & Replication Type |
| Chef | Chef Roles |
| Consul | Previous and Current Consul Leaders and Followers, Consul Datacenter,  Service Name, Service ID |
| CouchDB | Database Name,  Instance Name |
| CouchBase | CouchBase Tags,  Instance Name |
| Docker | Docker Container and Image Name, Container Command, Container Labels |
| Dyn | Zone, Record Type |
| Elasticsearch | Cluster Name,  Host Name, Port Number  |
| Etcd | State Leader or Follower |
| Fluentd | Host Name, Port Number |
| Google App Engine | Project Name, Version ID, Task Queue |
| Google Cloud Platform | Zone, Instance Type and ID, Automatic Restart, Project Name and ID, Name, Availability Zone in common with AWS tag after contacting Datadog support |
| Go Expvar | Expvar Path |
| Gunicorn | State Idle or Working, App Name |
| HAProxy | Service Name, Availability, Backend Host, Status, Type |
| HTTP Check | URL, Instance |
| IIS | Site |
| Jenkins | Job Name, Build Number, Branch, and Results |
| JMX | JMX Tags |
| Kafka | Topic |
| Kubernetes | Minion Name, Namespace, Replication Controller, Labels, Container Alias |
| Marathon | URL |
| Memcached | Host, Port,  Request, Cache Hit or Miss |
| Mesos | Role, URL, PID, Slave or Master Role, Node, Cluster,   |
| Mongo | Server Name |
| OpenStack | Network ID, Network Name, Hypervisor Name, ID, and Type, Tenant ID,  Availability Zone |
| PHP FPM | Pool Name |
| Pivotal | Current State, Owner, Labels, Requester, Story Type |
| Postfix | Queue, Instance |
| * Puppet | Puppet Tags |
| RabbitMQ | Node, Queue Name, Vhost, Policy, Host |
| Redis | Host, Port,  Slave or Master |
| RiakCS | Aggregation Key |
| SNMP | Device IP Address |
| Supervisord | Server Name, Process Name |
| TeamCity | Tags, Code Deployments, Build Number |
| TokuMX | Role Primary or Secondary, Replset, Replstate, Db, Coll, Shard |
| Varnish | Name, Backend |
| VSphere | Host, Datacenter, Server, Instance |
| Win32 Events | Event ID |
| Windows Services | Service Name |
{: .table}


<!-- ### Assigning tags using the configuration files
The Datadog integrations are all configured via the yaml configuration files located in the conf.d directory in your agent install. For more about where to look for your configuration files, refer [to this article][agentinstall]. You can define tags in the configuration file for the overall agent as well as for each integration, though the datadog.conf file is a more traditional ini file. In yaml files, there is a tag dictionary with a list of tags you want assigned at that level. Any tag you assign to the agent will apply to every integration on that agent's host.

Dictionaries with lists of values have two different yet functionally equivalent forms:

    tags: firsttag, secondtag, thirdtag

or

    tags:
      - firsttag
      - secondtag
      - thirdtag

You will see both forms in the yaml configuration files, but for the datadog.conf ini file only the first form is valid.

Each tag can be anything you like but you will have the best success with tagging if your tags are key:value pairs. Keys could represent the role, or function, or region, or application and the value is the instance of that role, function, region, or application. Here are some examples of good tags:

    region:east
    region:nw
    application:database
    database:primary
    role:sobotka

The reason why you should use key value pairs instead of simply values will become apparent when you start using the tags to filter and group metrics and machines. That said, you are not required to use key value pairs and simple values are valid.
-->


### 設定ファイルを使用してタグを割り当てる

Agent 組み込み型の Datadog インテグレーションは、 `conf.d` ディレクトリにある YAML 設定ファイルを参照して動作しています。従って、この設定ファイルにタグに関する記述をすることで、インテグレーションが送信する監視情報のタグを割り当てることができます。 YAML 設定ファイルのタグ項目には、インテグレーション レベルで割り当てたい情報を辞書形式で記述します。尚、YAML 設定ファイルの場所については、[次の記事][agentinstall]を参照してください。

又、 `datadog.conf` ファイルにタグ情報を追記することで、インストールしている Agent が送信している全ての監視情報にタグを割り当てることもできます。

複数の値が入った辞書形式のタグは、以下の様な二つの方法で記述することができます。

    tags: firsttag, secondtag, thirdtagag

または

    tags:
      - firsttag
      - secondtag
      - thirdtag

`conf.d` 以下のインテグレーション用 YAML では、どちら方法で記述しても機能します。
`datadog.conf` の方は、旧来の `ini` ファイル形式になるので、最初に示した記述方法のみ機能します。

タグを設定する場合のベストプラクティスは、 `key:value` のペアで割り当てることです。`key` は、ロール, 機能, 地域, アプリケーションなどの検索する際のキーを設定し、`value` は、そのインスタンスやそのインスタンスが所属するグループにおいける特定の文字列を設定します。

好ましいタグの組み合わせの例:

    region:east
    region:nw
    application:database
    database:primary
    role:sobotka

単純な文字列の指定ではなく、 `key:value` のペアを指定する理由は、タグを使用してメトリックとマシンを、フィルタリングしたりグループ化するときに明らかになります。(詳細に付いては、"タグの使い方"のセクションで説明します。)　尚、 `key:value` であることは必要条件ではないで、状況に応じて利用することは可能です。


<!--### Assigning host tags in the UI
You can also assign tags to hosts, but not to integrations in the UI. To assign tags in the UI, start by going to the Infrastructure List page. Click on any host and then click the Update Host Tags button. In the host overlay that appears, click Edit Tags and make the changes you wish. -->

### UIからのホスト タグの割り当て

ホストにタグを割り当てることもできますが、UIの統合にはタグを割り当てることはできません。 UIでタグを割り当てるには、まずインフラストラクチャリストページに移動します。任意のホストをクリックしてから、[Update Host Tags]ボタンをクリックします。表示されるホストオーバーレイで、[タグを編集]をクリックして、希望の変更を加えます。


<!-- ### Assigning host tags using the API
You can also assign tags to hosts, but not to integrations using the API. The endpoints you want to work with are /tags/hosts and depending on whether you PUT, POST, or DELETE you will update, add, or delete tags for the chosen host. For more details on using the Tags endpoints in the API, [review this document][tagsapi] -->

### APIを使用してホストタグを割り当てる

ホストにタグを割り当てることもできますが、APIを使用して統合することはできません。 作業したいエンドポイントは/ tags / hostsで、PUT、POST、DELETEのいずれかによって、選択したホストのタグを更新、追加、または削除します。 APIでタグのエンドポイントを使用する方法の詳細については、[このドキュメントを読む] [tagsapi]


<!-- ## How to use tags
After you have assigned tags at the host and integration level, you can start using them to filter and group in interesting ways. There are several places you can use tags:

- Events List
- Dashboards
- Infrastructure List
- Host Map
- Monitors -->

## タグの使い方

ホストとインテグレーションレベルでタグを割り当てたら、それらを使って興味深い方法でフィルタリングしてグループ化することができます。 タグを使用できる場所はいくつかあります：

- Events List
- Dashboards
- Infrastructure List
- Host Map
- Monitors


<!-- ### Using tags in the Events List
The Events List will show you all the events that have occured in your environment over the time period specified. This can be overwhelming so you can use tags to filter down the list based on the tags you have assigned. You can enter any text you want in the search box above the Event List and a full text search will be performed. You can also enter ```tags:``` followed by a tag to see all the events that come from a host or integration with that tag. The example in the image is the tag role:sobotka. So the search text is ```tags:role:sobotka```.

![Events List and Tags](/static/images/eventtags.png)
 -->

### イベントリストでのタグの使用

イベントリストには、指定した期間内に自分の環境で発生したすべてのイベントが表示されます。 これは圧倒的なので、タグを使用して、割り当てたタグに基づいてリストを絞り込むことができます。 イベントリストの上の検索ボックスに任意のテキストを入力すると、全文検索が実行されます。 `` tags： `` `と続けてタグをつけて、ホストから来たすべてのイベントやそのタグとの統合を見ることもできます。 イメージの例は、タグrole：sobotkaです。 したがって、検索テキストは `` tags：role：sobotka```です。

![Events List and Tags](/static/images/eventtags.png)


<!-- ### Using tags in Dashboards
You can use tags to narrow down the metrics to display on a dashboard grapm, or to create groups of metrics to display. To narrow down the metrics to display, enter the tag in the over: textbox. You will now be looking at a chosen metric over all the hosts that have that particular tag assigned. To group using tags, enter the key part of the tag in the group: textbox. For instance, if you have a timeseries graph and you have assigned the tags ```role:database```, ```role:frontend```, and ```role:loadbalancer```, you will get one line in your timeseries graph representing all the machines with the database, another of machines wth the frontend, and third of machines with the loadbalancer.

![Tags in Dashboards](/static/images/dashboardtags.png)

You can also use tags to overlay events on the dashboard. This works in exactly the same way as in the Events List. Simply enter ```tags:``` followed by the tag and you will see the corresponding events overlaid as vertical bars on each graph.
-->

### Dashboard でのタグの使用

タグを使用して、メトリックを絞り込んでダッシュボードgrapmに表示したり、表示するメトリックのグループを作成したりすることができます。 表示するメトリックを絞り込むには、上のテキストボックスにタグを入力します。 その特定のタグが割り当てられているすべてのホスト上で選択されたメトリックが表示されます。 タグを使用してグループ化するには、グループのテキストボックスにタグのキー部分を入力します。 たとえば、timeseriesグラフがあり、 `` `role：database```、` `role：frontend``、および` `role：loadbalancer```というタグを割り当てていると、 データベースを持つすべてのマシン、フロントエンドを持つマシン、ロードバランサを搭載したマシンの3分の1のtimeseriesグラフの行。

![Tags in Dashboards](/static/images/dashboardtags.png)

タグを使用して、ダッシュボード上のイベントをオーバーレイすることもできます。 これは、イベントリストとまったく同じ方法で動作します。 単に `` tags： `` `と続けてタグを入力すれば、対応するイベントが各グラフの縦線として重ねて表示されます。


<!-- ### Using tags in the Infrastructure List and the Host Map

To filter the list of hosts in the Infrastructure list, enter a tag in the filter textbox at the top of the page. You can also group the hosts by entering the key portion of the tag in the group by textbox. So if you enter role in the group box, you will see each role as a group heading followed by the hosts with that tag.

![Tags in the Infrastructure List](/static/images/infrastructuretags.png) -->

### インフラリストと Host map でのタグの使用

インフラストラクチャリストのホストリストをフィルタリングするには、ページ上部のフィルタテキストボックスにタグを入力します。 グループのテキストボックスにタグのキー部分を入力して、ホストをグループ化することもできます。 したがって、グループボックスにロールを入力すると、各ロールがグループヘッダーとして表示され、その後にそのタグを持つホストが表示されます。

![Tags in the Infrastructure List](/static/images/infrastructuretags.png)


<!-- ### Using tags in Monitors

When defining a monitor, you can use tags to allow the monitor to apply to any subset of hosts across your environment.

![Tags in Monitors](/static/images/monitortags.png)
 -->

### モニターでのタグの使用

モニターを定義するときには、タグを使用して、環境内のホストのサブセットにモニターを適用できます。

![Tags in Monitors](/static/images/monitortags.png)


[tagsapi]: /api#tags
[agentinstall]: https://app.datadoghq.com/account/settings#agent
