---
last_modified: 2016/02/27
translation_status: complete
language: ja
title_org: Guide to Service Discovery with Docker
title: Docker のサービス ディスカバリについてのガイド
kind: guide
listorder: 10
---

<!-- Docker is being [adopted rapidly](https://www.datadoghq.com/docker-adoption/) and platforms like Docker Swarm, Kubernetes and Amazon's ECS make running services easier and more resilient by managing orchestration and replication across hosts. But all of that makes monitoring more difficult. How can you monitor a service which is dynamically shifting from one host to another?

Datadog automatically keeps track of what is running where, thanks to its Service Discovery feature. Service Discovery allows you to define configuration templates that will be applied automatically to monitor your containers. -->

Dockerは[急速に採用されています]（https://www.datadoghq.com/docker-adoption/）、Docker Swarm、Kubernetes、AmazonのECSなどのプラットフォームは、ホスト間のオーケストレーションと複製を管理することで、サービスの実行をより簡単でより弾力性のあるものにします。 しかし、そのすべてが監視を難しくしています。 あるホストから別のホストに動的に移行しているサービスをどのように監視できますか？

Datadogは、サービスディスカバリー機能のおかげで、どこで実行されているかを自動的に追跡します。 Service Discoveryでは、コンテナを監視するために自動的に適用される構成テンプレートを定義できます。


<!-- ## How it works

As we consider [the problem of monitoring Docker](https://www.datadoghq.com/blog/the-docker-monitoring-problem/), one strategy is to move from a host-centric model to a service-oriented model. To do this, we'll run the Datadog Agent as a containerized service, rather than using Datadog Agents installed across all of our hosts.

The Service Discovery feature watches for Docker events like when a container is created, destroyed, started or stopped. When one of these happens, the Agent identifies which service is impacted, loads the configuration template for this image, and automatically sets up its checks.

Configuration templates can be defined by simple template files or as single key-value stores using etcd or Consul. -->

## 使い方

[Dockerを監視する問題（https://www.datadoghq.com/blog/the-docker-monitoring-problem/）]を考慮すると、ホスト中心のモデルからサービス指向のモデルに移行する戦略があります 。 これを実行するには、すべてのホストにインストールされているDatadogエージェントを使用するのではなく、データドッグエージェントをコンテナ化されたサービスとして実行します。

Service Discovery機能は、コンテナが作成、破棄、開始、または停止されたときのようなDockerイベントを監視します。 これらのいずれかが発生すると、エージェントは影響を受けるサービスを特定し、このイメージの設定テンプレートをロードし、自動的にチェックを設定します。

設定テンプレートは、単純なテンプレートファイルや、etcdやConsulを使った単一のKey-Valueストアとして定義できます。


<!-- ## How to set it up

To use Service Discovery, you'll first need to run the Datadog Agent as a service.

In Docker Swarm, you can do this by running the following command on one of your manager nodes (using your [API key](https://app.datadoghq.com/account/settings#api)):

    docker service create \
      --name dd-agent \
      --mode global \
      --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
      --mount type=bind,source=/proc/,target=/host/proc/,ro=true \
      --mount type=bind,source=/sys/fs/cgroup/,target=/host/sys/fs/cgroup,ro=true \
      -e API_KEY=<YOUR API KEY> \
      -e SD_BACKEND=docker \
      datadog/docker-dd-agent:latest

For Kubernetes, you can follow our [Kubernetes Integration](http://docs.datadoghq.com/integrations/kubernetes/) to create a DaemonSet. We also have [Amazon ECS integration instructions](http://docs.datadoghq.com/integrations/ecs/) available.

By default, the Datadog Agent includes Service Discovery support for:

- Apache Web Server
- Consul
- CouchDB
- Couchbase
- Elasticsearch
- etcd
- Kube State Metrics
- Kyoto Tycoon
- Memcached
- Redis
- Riak

These are provided by the configuration templates in the [Datadog Agent `conf.d/auto_conf` directory](https://github.com/DataDog/dd-agent/blob/master/conf.d/auto_conf).

To add Service Discovery for your custom container images, you simply need to add a configuration template to the `conf.d/auto_conf` directory.

## Configuration templates

The configuration templates in [the `conf.d/auto_conf` directory](https://github.com/DataDog/dd-agent/blob/master/conf.d/auto_conf) are nearly identical to the example YAML configuration files provided in [the Datadog `conf.d` directory](https://github.com/DataDog/dd-agent/tree/master/conf.d), but with one important field added. The `docker_images` field is required and identifies the container image(s) to which the configuration template should be applied.
-->

##セットアップ方法

サービスディスカバリを使用するには、まずDatadog Agentをサービスとして実行する必要があります。

Docker Swarmでは、[APIキー]（https://app.datadoghq.com/account/settings#api）を使用して、マネージャノードの1つで次のコマンドを実行することでこれを行うことができます。

    ドッカーサービスcreate \
      --name dd-agent \
      --mode global \
       - マウントタイプ=バインド、ソース= / var / run / docker.sock、ターゲット= / var / run / docker.sock \
      --mount type = bind、source = / proc /、target = / host / proc /、ro = true \
      ターゲット= /ホスト/ sys / fs / cgroup、ro = true \ / sys / fs / cgroup /
      -e API_KEY = <あなたのAPIキー> \
      -e SD_BACKEND =ドッカー\
      datadog / docker-dd-agent：latest

Kubernetesについては、[Kubernetes Integration]（http://docs.datadoghq.com/integrations/kubernetes/）に従ってDaemonSetを作成することができます。また、[Amazon ECS integration instructions]（http://docs.datadoghq.com/integrations/ecs/）も利用可能です。

デフォルトでは、Datadog Agentには次のサービス検出のサポートが含まれています。

- Apache Webサーバー
- 領事
- CouchDB
- カウチベース
- 弾性検索
- etcd
- Kube州の統計情報
- 京都タイクーン
- Memcached
- レディス
- Riak

これらは、[Datadog Agentのconf.d / auto_conf`ディレクトリ]（https://github.com/DataDog/dd-agent/blob/master/conf.d/auto_conf）の設定テンプレートによって提供されます。

独自のコンテナイメージ用のサービスディスカバリを追加するには、 `conf.d / auto_conf`ディレクトリに設定テンプレートを追加するだけです。

##設定テンプレート

[ `conf.d / auto_conf`ディレクトリ]（https://github.com/DataDog/dd-agent/blob/master/conf.d/auto_conf）内の構成テンプレートが提供された例のYAML設定ファイルとほぼ同じです【Datadog `conf.d`ディレクトリ]（https://github.com/DataDog/dd-agent/tree/master/conf.d）ではなく、一つの重要なフィールドを追加しました。 `docker_images`フィールドが必要とする構成テンプレートを適用する必要があるために容器の画像（複数可）を識別します。


<!-- ### Template variables

Because orchestration tools like Docker Swarm and Kubernetes automatically run your containers on arbitrary hosts, the host address and port where your service reports metrics will be dynamic. To account for this in your configuration template, you can use the variables `%%host%%` and `%%port%%`.

 When a list of values is expected for the variable and selecting a specific one is mandatory, you can specify the value from the list by appending an underscore followed by an index or key. For example `%%host_0%%` or `%%port_4%%`. Note that indexes begin at 0 and if no index is provided, the last value in the value list ordered increasingly will be used.

Let's take the example of the port variable: a RabbitMQ container with the management module enabled has 6 exposed ports by default. The list of ports as seen by the agent is: `[4369, 5671, 5672, 15671, 15672, 25672]`. **Notice the order. The Agent always sorts values in ascending order.**

The default management port for the rabbitmq image is `15672` with index 4 in the list (starting from 0), so the template variable needs to be `%%port_4%%`.

As of version `5.8.3` of the Datadog Agent, you can also use keys as a suffix when a variable contains a dictionary. This is particularly useful to select an IP address for a container that has several networks attached.

As an example if the rabbitmq container mentioned above is available over two networks `bridge` and `swarm`, using `%%host_swarm%%` will pick the IP address from the swarm network.
Note that for the `host` variable if several networks are found and no key is passed the agent attempts to use the default `bridge` network. -->

###テンプレート変数

Docker SwarmやKubernetesのようなオーケストレーションツールはコンテナを任意のホスト上で自動的に実行するため、サービスレポートのメトリックが動的になるホストアドレスとポートが表示されます。設定テンプレートでこれを説明するには、変数 `%% host %% 'と` %% port %%'を使用できます。

 変数の値のリストが必要で、特定のものを選択する必要がある場合、アンダースコアの後ろにインデックスまたはキーを追加して、リストから値を指定できます。たとえば、 `%% host_0 %%`や `%% port_4 %%`などです。インデックスは0から始まり、インデックスが指定されていない場合、値リスト内の最後の値がますます使用されることに注意してください。

ポート変数の例を考えてみましょう。管理モジュールが有効になっているRabbitMQコンテナには、デフォルトで6つの公開ポートがあります。エージェントが見るポートのリストは、 `[4369,5671,5672,15671,15672,25672]`です。 **注文に注意してください。エージェントは常に値を昇順にソートします。**

rabbitmqイメージのデフォルトの管理ポートは、リスト内のインデックスが4（ '0'から始まる）である '15672'なので、テンプレート変数は `%% port_4 %% 'である必要があります。

Datadog Agentのバージョン5.8.3では、変数に辞書が含まれている場合にキーを接尾辞として使用することもできます。これは、複数のネットワークが接続されているコンテナのIPアドレスを選択する場合に特に便利です。

例として、上記のrabbitmqコンテナが2つのネットワーク `bridge`と` swarm`で利用可能な場合、 `%% host_swarm %% 'を使用すると、swarmネットワークからIPアドレスが選択されます。
`host`変数の場合、いくつかのネットワークが見つかってキーが渡されない場合、エージェントはデフォルトの` bridge`ネットワークを使用しようとします。


<!-- ## Configuration templates with key-value stores

Service Discovery using configuration templates in the Datadog Agent  `conf.d/auto_conf` directory is a straightforward process, though managing your templates and copying them into the Datadog Agent container (or building your own Datadog Agent container to include custom configuration templates) can make scaling this process difficult.

To make configuration template management easier, you can use etcd or Consul, two popular distributed key-value stores, as a repository for your templates.

First you'll need to configure etcd or Consul as your Service Discovery backend by either updating the `datadog.conf` file or passing the settings as environment variables when starting the Datadog Agent service. -->

##キー・バリュー・ストアを持つ構成テンプレート

テンプレートを管理してDatadog Agentコンテナにコピーする（または独自のDatadog Agentコンテナをビルドしてカスタム構成テンプレートを組み込む）ことで、Datadog Agentの `conf.d / auto_conf`ディレクトリ内の設定テンプレートを使用したサービスディスカバリは簡単なプロセスです。 このプロセスをスケーリングするのは難しい。

設定テンプレートの管理を容易にするために、普及している2つの分散キーストアであるetcdやConsulをテンプレートのリポジトリとして使用することができます。

まず、datadog.confファイルを更新するか、Datadog Agentサービスを開始するときに環境変数として設定を渡すことによって、サービスディスカバリバックエンドとしてetcdまたはConsulを設定する必要があります。


<!-- ### Configuring etcd or Consul in `datadog.conf`

In the `dataodg.conf` file, you can enable etcd or Consul as a service discovery configuration backend by uncommenting and configuring the `sd_config_backend`, `sd_backend_host`, and `sd_backend_port` settings. If you are using Consul, you will also need to uncomment and set the `consul_token`.

    # For now only Docker is supported so you just need to un-comment this line.
    service_discovery_backend: docker

    # Define which key/value store must be used to look for configuration templates.
    # Default is etcd. Consul is also supported.
    sd_config_backend: etcd

    # Settings for connecting to the backend. These are the default, edit them if you run a different config.
    sd_backend_host: 127.0.0.1
    sd_backend_port: 4001

    # By default, the agent will look for the configuration templates under the
    # `/datadog/check_configs` key in the back-end.
    # If you wish otherwise, uncomment this option and modify its value.
    # sd_template_dir: /datadog/check_configs

    # If you Consul store requires token authentication for service discovery, you can define that token here.
    # consul_token: f45cbd0b-5022-samp-le00-4eaa7c1f40f1 -->

### `datadog.conf`にetcdやConsulを設定する

`dataodg.conf`ファイルでは、` sd_config_backend`、 `sd_backend_host`、` sd_backend_port`の設定を解除して設定することで、etcdやConsulをサービスディスカバリ設定バックエンドとして有効にすることができます。領事を使用している場合は、コメントを外して「consul_token」も設定する必要があります。

    ＃今のところDockerだけがサポートされているので、この行のコメントを解除するだけです。
    service_discovery_backend：ドッカー

    ＃構成テンプレートを探すために使用するキー/値ストアを定義します。
    ＃デフォルトはetcdです。領事もサポートされています。
    sd_config_backend：etcd

    ＃バックエンドに接続するための設定。これらはデフォルトです。別の設定を実行する場合は編集してください。
    sd_backend_host：127.0.0.1
    sd_backend_port：4001

    ＃デフォルトでは、エージェントは以下の設定テンプレートを検索します。
    バックエンドの＃/ datadog / check_configsキーを押してください。
    ＃そうでない場合は、このオプションのコメントを外し、その値を変更します。
    ＃sd_template_dir：/ datadog / check_configs

    ＃Consulストアにサービス検出のトークン認証が必要な場合は、ここでそのトークンを定義できます。
    ＃consul_token：f45cbd0b-5022-samp-le00-4eaa7c1f40f1


<!-- ### Configuring etcd or Consul using environment variables

To pass the settings listed above as environment variables when starting the Datadog Agent in Docker Swarm, you would run the command:

    docker service create \
      --name dd-agent \
      --mode global \
      --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
      --mount type=bind,source=/proc/,target=/host/proc/,ro=true \
      --mount type=bind,source=/sys/fs/cgroup/,target=/host/sys/fs/cgroup,ro=true \
      -e API_KEY=<YOUR API KEY> \
      -e SD_BACKEND=docker \
      -e SD_CONFIG_BACKEND=etcd \
      -e SD_BACKEND_HOST=127.0.0.1 \
      -e SD_BACKEND_PORT=4001 \
      datadog/docker-dd-agent:latest -->

### 環境変数を使ってetcdやConsulを設定する

Docker SwarmでDatadog Agentを起動するときに上記の環境変数を設定するには、次のコマンドを実行します。

     ドッカーサービスcreate \
       --name dd-agent \
       --mode global \
       - マウントタイプ=バインド、ソース= / var / run / docker.sock、ターゲット= / var / run / docker.sock \
       --mount type = bind、source = / proc /、target = / host / proc /、ro = true \
       ターゲット= /ホスト/ sys / fs / cgroup、ro = true \ / sys / fs / cgroup /
       -e API_KEY = <あなたのAPIキー> \
       -e SD_BACKEND =ドッカー\
       -s SD_CONFIG_BACKEND = etcd \
       -e SD_BACKEND_HOST = 127.0.0.1 \
       -e SD_BACKEND_PORT = 4001 \
       datadog / docker-dd-agent：latest


<!-- ### Template structure in key-value stores

After your Datadog Agent service has been configured to use your Service Discovery configuration backend, you will need to store your configuration templates in the structure:

    /datadog/
      check_configs/
        docker_image_0/
          - check_names: ["check_name_0"]
          - init_configs: [{init_config}]
          - instances: [{instance_config}]
        docker_image_1/
          - check_names: ["check_name_1a", "check_name_1b"]
          - init_configs: [{init_config_1a}, {init_config_1b}]
          - instances: [{instance_config_1a}, {instance_config_1b}]
        ...

Note that in the structure above, you may have multiple checks for a single container. For example you may run a Java service that provides an HTTP API, using the HTTP check and the JMX integration at the same time. To declare that in templates, simply add elements to the `check_names`, `init_configs`, and `instances lists`. These elements will be matched together based on their index in their respective lists.
 -->

### キー値ストアのテンプレート構造

Datadog AgentサービスがService Discovery設定バックエンドを使用するように設定された後、構成テンプレートを構造体に保存する必要があります。

    / datadog /
      check_configs /
        docker_image_0 /
           - check_names：["check_name_0"]
           - init_configs：[{init_config}]
           - インスタンス：[{instance_config}]
        docker_image_1 /
           - check_names：["check_name_1a"、 "check_name_1b"]
           - init_configs：[{init_config_1a}、{init_config_1b}]
           - インスタンス：[{instance_config_1a}、{instance_config_1b}]
        ...

上記の構造では、1つのコンテナに対して複数のチェックがあることに注意してください。たとえば、HTTPチェックとJMX統合を同時に使用して、HTTP APIを提供するJavaサービスを実行できます。テンプレートで宣言するには、単に `check_names`、` init_configs`、 `instances lists`に要素を追加します。これらの要素は、それぞれのリストのインデックスに基づいて一致します。


<!-- ### Example: Apache Web Server

By default, the Datadog Agent supports Service Discovery for the Apache Web Server through the [`conf.d/auto_conf/apache.yaml` file](https://github.com/DataDog/dd-agent/blob/master/conf.d/auto_conf/apache.yaml):

    docker_images:
      - httpd

    init_config:

    instances:
      - apache_status_url: http://%%host%%/server-status?auto

To store the same configuration template in etcd you could run the following commands:

    etcdctl mkdir /datadog/check_configs/httpd
    etcdctl set /datadog/check_configs/httpd/check_names '["apache"]'
    etcdctl set /datadog/check_configs/httpd/init_configs '[{}]'
    etcdctl set /datadog/check_configs/httpd/instances '[{"apache_status_url": "http://%%host%%/server-status?auto"}]' -->

###例：Apache Webサーバー

デフォルトでは、Datadog Agentは[`conf.d / auto_conf / apache.yaml`ファイル]（https://github.com/DataDog/dd-agent/blob/master/conf）を介してApache Web Serverのサービス検出をサポートしています .d / auto_conf / apache.yaml）：

     docker_images：
       - httpd

     init_config：

     インスタンス：
       - apache_status_url：http：// %%ホスト%% / server-status？auto

同じ構成テンプレートをetcdに保存するには、次のコマンドを実行します。

     etcdctl mkdir / datadog / check_configs / httpd
     etcdctl set / datadog / check_configs / httpd / check_names '["apache"]'
     etcdctl set / datadog / check_configs / httpd / init_configs '[{}]'
     etc / apache_status_url： "http：// %% host %% / server-status？auto"}] '/ etc / httpd /


<!-- ### Image name format in the configuration store

Before version `5.8.3` of the Datadog Agent it was required to truncate the image name to its minimum. e.g. for the Docker image `quay.io/coreos/etcd:latest` the key in the configuration store needed to be `datadog/check_configs/etcd/...`

To make configuration more precise we now use the complete container image identifier in the key. So the agent will look in `datadog/check_configs/quay.io/coreos/etcd:latest/...`, and fallback to the old format if no template was found to ensure backward compatibility. -->

###構成ストア内のイメージ名の形式

Datadog Agentのバージョン5.8.3より前では、イメージ名を最小限にする必要がありました。 例えば Dockerイメージの `quay.io/coreos/etcd：latest`コンフィギュレーションストア内のキーは` datadog / check_configs / etcd / ... `にする必要がありました。

設定をより正確にするために、キー内に完全なコンテナイメージ識別子を使用します。 したがって、エージェントは `datadog / check_configs / quay.io / coreos / etcos：latest / ...`で検索し、下位互換性を保証するテンプレートが見つからなければ古いフォーマットにフォールバックします。


<!-- ### Using Docker label to specify the template path

In case you need to match different templates with containers running the same image, it is also possible starting with `5.8.3` to define explicitly which path the agent should look for in the configuration store to find a template using the `com.datadoghq.sd.check.id` label.

For example, if a container has this label configured as `com.datadoghq.sd.check.id: foobar`, it will look for a configuration template in the store under the key `datadog/check_configs/foobar/...`. -->

### Dockerラベルを使用してテンプレートパスを指定する

同じイメージを実行するコンテナとは異なるテンプレートをマッチさせる必要がある場合は、 `5.8.3`からエージェントがコンフィギュレーションストアで探すべきパスを明示的に定義し、` com.datadoghq .sd.check.id`ラベル。

たとえば、コンテナのラベルが `com.datadoghq.sd.check.id：foobar`に設定されている場合、ストア内でキー` datadog / check_configs / foobar / ... `の下にある設定テンプレートを探します。


<!-- ## Configuration templates with Kubernetes annotations

As of version 5.12 of the Datadog Agent, you can use Kubernetes pod annotations to store your configuration templates. Follow the [Kubernetes integration instructions](/integrations/kubernetes/), then add annotations to your pod definitions. The basic format looks similar to the structure used in the key-value store configuration above, but for Kubernetes it takes the form:

    annotations:
      service-discovery.datadoghq.com/<Kubernetes Container Name>.check_names: '["check_name_0"]'
      service-discovery.datadoghq.com/<Kubernetes Container Name>.init_configs: '[{init_config}]'
      service-discovery.datadoghq.com/<Kubernetes Container Name>.instances: '[{instance_config}]'

Also similar to the key-value store configuration above, you include multiple checks for a container within in the pod. Each element from `check_names`, `init_configs`, and `instances` will be matched together based on their index. In pods with multiple containers, you can simply include additional annotations using the corresponding Kubernetes container name. -->

## Kubernetesアノテーションによる設定テンプレート

Datadog Agentのバージョン5.12では、Kubernetes podアノテーションを使用して設定テンプレートを保存することができます。 [Kubernetes integration instructions]（/ integations / kubernetes /）に従い、注釈をポッド定義に追加します。基本的なフォーマットは、上記のキーバリューストア構成で使用されている構造に似ていますが、Kubernetesの場合、次の形式があります。

    注釈：
      Service-discovery.datadoghq.com/ <コンテナ名> .check_names： '["check_name_0"]'
      <kubernetes Container Name> .init_configs： '[{init_config}]'サービス - ディストリビューション.datadoghq.com/
      service-discovery.datadoghq.com/ <コンテナ名>。インスタンス： '[{instance_config}]'

また、上記のKey-Valueストア設定と同様に、ポッド内のコンテナに対して複数のチェックを行います。 `check_names`、` init_configs`、そして `instances`の各要素は、それらのインデックスに基づいて一緒にマッチします。複数のコンテナを持つポッドでは、対応するKubernetesコンテナ名を使用して注釈を追加するだけです。


<!-- ### Example: Apache Web Server

Here's an example of the Apache YAML file that would correspond to the configuration template [`conf.d/auto_conf/apache.yaml` file](https://github.com/DataDog/dd-agent/blob/master/conf.d/auto_conf/apache.yaml):

    apiVersion: v1
    kind: Pod
    metadata:
      name: apache
      annotations:
        service-discovery.datadoghq.com/apache.check_names: '["apache"]'
        service-discovery.datadoghq.com/apache.init_configs: '[{}]'
        service-discovery.datadoghq.com/apache.instances: '[{"apache_status_url": "http://%%host%%/server-status?auto"}]'
      labels:
        name: apache
    spec:
      containers:
        - name: apache
          image: httpd
          ports:
            - containerPort: 80 -->

###例：Apache Webサーバー

次に、設定テンプレート[`conf.d / auto_conf / apache.yaml`ファイル]（https://github.com/DataDog/dd-agent/blob/master/conf）に対応するApache YAMLファイルの例を示します。 d / auto_conf / apache.yaml）：

     apiVersion：v1
     種類：ポッド
     メタデータ：
       名前：apache
       注釈：
         service-discovery.datadoghq.com/apache.check_names： '["apache"]'
         service-discovery.datadoghq.com/apache.init_configs： '[{}]'
         '[{"apache_status_url"： "http：// %%ホスト%% / server-status？auto"}]
       ラベル：
         名前：apache
     仕様：
       コンテナ：
         - 名前：apache
           image：httpd
           ポート：
             - containerPort：80
