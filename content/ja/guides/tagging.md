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

後に有効に機能しそうなタグの組み合わせの例:

    region:east
    region:nw
    application:database
    database:primary
    role:sobotka

単純な文字列の指定ではなく、 `key:value` のペアを指定する理由は、タグを使用してメトリックとマシンを、フィルタリングしたりグループ化するときに明らかになります。(詳細に付いては、"タグの使い方"のセクションで説明します。)　尚、 `key:value` であることは必要条件ではないで、状況に応じて利用することは可能です。


<!--### Assigning host tags in the UI
You can also assign tags to hosts, but not to integrations in the UI. To assign tags in the UI, start by going to the Infrastructure List page. Click on any host and then click the Update Host Tags button. In the host overlay that appears, click Edit Tags and make the changes you wish. -->

### UI からのホスト タグの割り当て

UI からホストにタグを割り当てることもできます。但し UI からインテグレーション関連の情報には割り当てることはできません。 UI でタグを割り当てるには、まず Infrastructure List ページに移動し、ホスト行の余白部分をクリックします。右側から飛び出してきたオーバーレイで、 Edit Tags ボタンをクリックし、タグを追加/削除をします。


<!-- ### Assigning host tags using the API
You can also assign tags to hosts, but not to integrations using the API. The endpoints you want to work with are /tags/hosts and depending on whether you PUT, POST, or DELETE you will update, add, or delete tags for the chosen host. For more details on using the Tags endpoints in the API, [review this document][tagsapi] -->

### API を使用してホストタグを割り当てる

API を使ってホストにタグを割り当てることもできます。但し API を使用してインテグレーション関連の情報には割り当てることはできません。

APIで操作するべきエンドポイントは、 `/tags/hosts` で、PUT, POST, DELETE メソッドのいずれかにより、ホストのタグを更新、追加、または削除することができます。 API 使ってタグのエンドポイントを使用する方法については、["API Reference"][tagsapi]を参照してください。


<!-- ## How to use tags
After you have assigned tags at the host and integration level, you can start using them to filter and group in interesting ways. There are several places you can use tags:

- Events List
- Dashboards
- Infrastructure List
- Host Map
- Monitors -->

## タグの使い方

ホストとインテグレーション関連の情報にタグを割り当てたら、それらを使ってフィルタリングしたりグループ化したりすることができます。

以下は、タグを有効に活用していきたいページです:

- Events List
- Dashboard
- Infrastructure List
- Host Map
- モニタ(アラート機能)


<!-- ### Using tags in the Events List
The Events List will show you all the events that have occured in your environment over the time period specified. This can be overwhelming so you can use tags to filter down the list based on the tags you have assigned. You can enter any text you want in the search box above the Event List and a full text search will be performed. You can also enter ```tags:``` followed by a tag to see all the events that come from a host or integration with that tag. The example in the image is the tag role:sobotka. So the search text is ```tags:role:sobotka```.

![Events List and Tags](/static/images/eventtags.png)
 -->

### Events List でのタグの使用

Events List には、指定した期間内に監視対象内で発生したすべてのイベントが表示されます。一般的にリストには、圧倒的な量のイベントが表示されるはずです。従って、割り当てたタグに基づいて、リストに表示されるイベントの量を絞り込みます。 Events List の上の検索ボックスに任意のテキストを入力すると、全文検索が実行されます。 ```tags:``` に続けて文字列を入力すると、その文字列のタグを持ったホストやインテグレーションから届いた全てのイベントを見ることもできます。以下のキャプチャの例は、"role:sobotka" のタグの付いたイベントを表示しています。従って、検索文字列として ```tags:role:sobotka``` と入力しています。

![Events List and Tags](/static/images/eventtags.png)


<!-- ### Using tags in Dashboards
You can use tags to narrow down the metrics to display on a dashboard grapm, or to create groups of metrics to display. To narrow down the metrics to display, enter the tag in the over: textbox. You will now be looking at a chosen metric over all the hosts that have that particular tag assigned. To group using tags, enter the key part of the tag in the group: textbox. For instance, if you have a timeseries graph and you have assigned the tags ```role:database```, ```role:frontend```, and ```role:loadbalancer```, you will get one line in your timeseries graph representing all the machines with the database, another of machines wth the frontend, and third of machines with the loadbalancer.

![Tags in Dashboards](/static/images/dashboardtags.png)

You can also use tags to overlay events on the dashboard. This works in exactly the same way as in the Events List. Simply enter ```tags:``` followed by the tag and you will see the corresponding events overlaid as vertical bars on each graph.
-->

### Dashboard でのタグの使用

タグを使用して、メトリクスを絞り込みダッシュボード内のグラフに表示したり、表示するメトリックをグループ化し表示したりすることができます。 タグを使用して表示するメトリクスを絞り込むには、 "from" の右側のテキストボックスにタグを入力します。この指定により、選択されたメトリクスの中で、そのタグが割り当てられているもの全てが表示されます。 タグを使用してグループ化するには、 "xxxx by" の右側にあるテキストボックスに "key:value" タグの key を入力します。たとえば、 timeseries グラフを設定している際に、 インフラの各レイアに ```role:database```, ```role:frontend```, ```role:loadbalancer``` というタグを割り当てている場合は、 `role` を指定することで、 database を持つ全てのマシン群、 frontend を持つマシン群、 loadbalancer をマシン群と、三本の線を持ったグラフを表示することができます。

![Tags in Dashboards](/static/images/dashboardtags.png)

更に、タグを使用して、ダッシュボード上にイベントをオーバーレイすることもできます。 これは、Event List での使い方とまったく同じ方法で動作します。 単に ```tags：``` に続けてタグを入力すれば、対応するイベントが各グラフにピンクの縦線として上書き表示されます。


<!-- ### Using tags in the Infrastructure List and the Host Map

To filter the list of hosts in the Infrastructure list, enter a tag in the filter textbox at the top of the page. You can also group the hosts by entering the key portion of the tag in the group by textbox. So if you enter role in the group box, you will see each role as a group heading followed by the hosts with that tag.

![Tags in the Infrastructure List](/static/images/infrastructuretags.png) -->

### Infrastructure List と Host Map でのタグの使用

Infrastructure List にあるホストをフィルタリングしリストを表示するには、ページ上部のフィルタ用テキスト ボックスにタグを入力します。更に、"Group by tags:" のテキストボックスにタグのkey部分を入力して、ホストをグループ化することもできます。
"Group by tags:" に `role` などのタグのkey部分を入力すると、各ロール値がグループヘッダーとして表示され、その後にそのタグを持つホストが順次表示されます。

![Tags in the Infrastructure List](/static/images/infrastructuretags.png)


<!-- ### Using tags in Monitors

When defining a monitor, you can use tags to allow the monitor to apply to any subset of hosts across your environment.

![Tags in Monitors](/static/images/monitortags.png)
 -->

### モニタでのタグの使用

モニタを定義する際は、タグを使用してインフラ リスト内の全ホストのサブセットを定義し、アラートに必要な条件を適用することができます。

![Tags in Monitors](/static/images/monitortags.png)


[tagsapi]: /api#tags
[agentinstall]: https://app.datadoghq.com/account/settings#agent
