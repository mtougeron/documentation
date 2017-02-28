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

弊社の利用実態を見ると、[Dockerが急速に浸透し始めている](https://www.datadoghq.com/docker-adoption/)のがよく分かります。そして、Docker Swarm, Kubernetes, Amazon ECS のようなプラットフォームを採用することで、コンテナの複製とオーケストレーションの管理をすることができるようになり、 Dokcer に構築したサービスをより簡単勝つ安定して運用ができるようになりました。しかしこれらの仕組みは、インフラの監視をより困難にしました。ホスト間を動的に移動していくサービス環境をどのように監視していますか?

Datadog が提供する監視の仕組みでは、サービス ディスカバリ機能を使って、どこで何が実行されているかを自動的に追跡することができます。サービス ディスカバリでは、コンテナの監視を自動で開始するために必要な設定ファイルのテンプレートを定義しておくことができます。


<!-- ## How it works

As we consider [the problem of monitoring Docker](https://www.datadoghq.com/blog/the-docker-monitoring-problem/), one strategy is to move from a host-centric model to a service-oriented model. To do this, we'll run the Datadog Agent as a containerized service, rather than using Datadog Agents installed across all of our hosts.

The Service Discovery feature watches for Docker events like when a container is created, destroyed, started or stopped. When one of these happens, the Agent identifies which service is impacted, loads the configuration template for this image, and automatically sets up its checks.

Configuration templates can be defined by simple template files or as single key-value stores using etcd or Consul. -->

## 動作の原理

["The Docker monitoring problem" (Docker を監視する際の課題) ](https://www.datadoghq.com/blog/the-docker-monitoring-problem/)の考察からも、この課題を解決するための一つの方法は、ホスト中心の監視モデルからサービスを切り口とした監視モデルへ移行する戦略です。この戦略を具現化するには、各ホストにインストールされた Datadog Agent を利用するのではなく、サービス コンテナ化されたDatadog Agent を実行する必要があります。

サービス ディスカバリ機能は、コンテナの作成/破棄/開始/停止のような Docker イベントを監視します。いずれかのイベントが発生すると、Agent は、影響を受けるサービスを特定します。その後、Agent は、そのイメージの監視に必要な設定用テンプレートをロードし、自動的に監視のための設定を実施します。

設定用のテンプレートは、単純ファイル形式や、etcd, Consul を使った Key-Value ストアとして定義することができます。


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
-->

## セットアップの仕方

サービス ディスカバリを使用するには、まず サービス コンテナ化された Datadog Agent を実行する必要があります。

Docker Swarm の場合は、管理ノードのどれかで次のコマンドを実行します。([API key](https://app.datadoghq.com/account/settings#api) は、Datadog のアカウント情報に基づいて書き換えてください。)

    docker service create \
      --name dd-agent \
      --mode global \
      --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
      --mount type=bind,source=/proc/,target=/host/proc/,ro=true \
      --mount type=bind,source=/sys/fs/cgroup/,target=/host/sys/fs/cgroup,ro=true \
      -e API_KEY=<YOUR API KEY> \
      -e SD_BACKEND=docker \
      datadog/docker-dd-agent:latest

Kubernetes の場合は、["Kubernetes Integration"](http://docs.datadoghq.com/integrations/kubernetes/) に従って DaemonSet を作成してください。又、ECSの場合は、["Amazon ECS integration instructions"](http://docs.datadoghq.com/integrations/ecs/) を参照してください。

Datadog Agent には、次のサービス ディスカバリ機能がデフォルトで組み込まれています:

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

これら設定テンプレートは、Datadog Agent 内の[`conf.d/auto_conf`](https://github.com/DataDog/dd-agent/blob/master/conf.d/auto_conf) ディレクトリに保存されています。

オリジナルのコンテナ イメージ用にサービス ディスカバリ機能を追加するには、`conf.d/auto_conf` ディレクトリに、設定用テンプレートを追加するだけです。


<!-- ## Configuration templates

The configuration templates in [the `conf.d/auto_conf` directory](https://github.com/DataDog/dd-agent/blob/master/conf.d/auto_conf) are nearly identical to the example YAML configuration files provided in [the Datadog `conf.d` directory](https://github.com/DataDog/dd-agent/tree/master/conf.d), but with one important field added. The `docker_images` field is required and identifies the container image(s) to which the configuration template should be applied. -->

## 設定用のテンプレート

[`conf.d/auto_conf`](https://github.com/DataDog/dd-agent/blob/master/conf.d/auto_conf) ディレクトリ内で提供されている設定用のテンプレートは、`docker_images`という追加フィールドを覗いて、 Datadog Agent の [`conf.d`](https://github.com/DataDog/dd-agent/tree/master/conf.d) 内で提供しているの設定用 YMAL ファイルと同じです。 テンプレートでは、この `docker_images` フィールドに、テンプレートを適用する対象コンテナ イメージを必ず指定する必要があります。


<!-- ### Template variables

Because orchestration tools like Docker Swarm and Kubernetes automatically run your containers on arbitrary hosts, the host address and port where your service reports metrics will be dynamic. To account for this in your configuration template, you can use the variables `%%host%%` and `%%port%%`.

 When a list of values is expected for the variable and selecting a specific one is mandatory, you can specify the value from the list by appending an underscore followed by an index or key. For example `%%host_0%%` or `%%port_4%%`. Note that indexes begin at 0 and if no index is provided, the last value in the value list ordered increasingly will be used.

Let's take the example of the port variable: a RabbitMQ container with the management module enabled has 6 exposed ports by default. The list of ports as seen by the agent is: `[4369, 5671, 5672, 15671, 15672, 25672]`. **Notice the order. The Agent always sorts values in ascending order.**

The default management port for the rabbitmq image is `15672` with index 4 in the list (starting from 0), so the template variable needs to be `%%port_4%%`.

As of version `5.8.3` of the Datadog Agent, you can also use keys as a suffix when a variable contains a dictionary. This is particularly useful to select an IP address for a container that has several networks attached.

As an example if the rabbitmq container mentioned above is available over two networks `bridge` and `swarm`, using `%%host_swarm%%` will pick the IP address from the swarm network.
Note that for the `host` variable if several networks are found and no key is passed the agent attempts to use the default `bridge` network. -->

### テンプレート変数

Docker Swarm や Kubernetes のようなオーケストレーション ツールは、任意のホスト上でコンテナを自動的に起動するため、監視対象となっているサービスのメトリクスを公開している IP アドレスやポート番号は、動的に変化してします。設定用のテンプレート内では、この現象に対処するために `%%host%%` と` %%port%%` という変数を使用することができます。

変数の値にリスト化した複数の値が考えられる場合、どれか一つを選択する必要があります。このよう場な場合、変数名に続いてアンダースコアとインデックス、又はキーを付記して、値を指定することができます。例えば、 `%%host_0%%` や `%%port_4%%` などです。インデックスは、 `0` から始まります。インデックスが指定されていない場合は、値リスト内の最後の値(最も大きい値)が採用されることに注意してください。

ポート番号の変数を例に考えてみましょう: 管理モジュールが有効になっている RabbitMQ コンテナには、デフォルトで6つのアクセス可能なポートがあります。Agent が、見ることのできるポートのリストは、 `[4369,5671,5672,15671,15672,25672]` になります。**値の並んでいる順番に注意してください。Agent は、常に値を昇順にソートします。**

今回の rabbitmq イメージのデフォルトの管理ポートは、`15672` で、リスト内のインデックスが `4`（`0` から始まる）になり、テンプレート変数は `%%port_4%%` と指定する必要があります。

Datadog Agent の v`5.8.3` 以降では、変数が辞書形式になっている場合に、変数の接尾語にキーも使用できるようになりました。この機能は、複数のネットワークと接続しているコンテナのIPアドレスを指定する場合に特に便利です。

例として、上記の rabbitmq コンテナが、`bridge` と `swarm` という二つのネットワークから利用可能な場合、 `%%host_swarm%%` を指定すると、swarm ネットワーク側のIPアドレスをすることができます。

`host` 変数の場合、複数のネットワークを検知したがキーが渡されない場合、Agent はデフォルトの` bridge` ネットワークを使用しようとします。


<!-- ## Configuration templates with key-value stores

Service Discovery using configuration templates in the Datadog Agent  `conf.d/auto_conf` directory is a straightforward process, though managing your templates and copying them into the Datadog Agent container (or building your own Datadog Agent container to include custom configuration templates) can make scaling this process difficult.

To make configuration template management easier, you can use etcd or Consul, two popular distributed key-value stores, as a repository for your templates.

First you'll need to configure etcd or Consul as your Service Discovery backend by either updating the `datadog.conf` file or passing the settings as environment variables when starting the Datadog Agent service. -->


## Key-Value ストアを使った場合の設定

Datadog Agent の `conf.d/auto_conf` ディレクトリ内にある設定用テンプレートを使用したサービス ディスカバリは、非常に明快なプロセスです。しかしながら、テンプレートを管理し、それらを各 Agent コンテナにコピーする作業(又は、専用の設定用テンプレートを含む独自の Agent コンテナをビルドすること)は、煩雑でスケールしません。

設定用テンプレートの管理を容易にするために、分散 key-value ストアの etcd や Consul を、テンプレートのリポジトリとして使用することができます。

etcd または Consul を利用するためには、サービス ディスカバリ バックエンドとして、Agentに認識させる必要があります。 `datadog.conf` ファイルを更新してサービス ディスカバリ バックエンドの指定をするか、Datadog Agentのサービスコンテナを起動する際に環境変数として設定を与える方法で認識させることができます。


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

### `datadog.conf` 内に etcd や Consul への設定を記述する方法

`dataodg.conf` ファイル内で、`sd_config_backend`, `sd_backend_host`, `sd_backend_port` の前の `#` を削除し、設定したい内容を記述することで、 etcd や Consul をサービス ディスカバリのバックエンドとして機能させることができます。Consul を使用している場合は、同様にして `consul_token` も設定する必要があります。

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
    # consul_token: f45cbd0b-5022-samp-le00-4eaa7c1f40f1


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

### 環境変数を使って etcd や Consul を設定する方法

バックエンドの設定を、環境変数として渡す場合は、次のようなコマンドを実行します。 以下は、Docker Swarm で Agent サービスコンテナを起動するコマンドの例です:

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
      datadog/docker-dd-agent:latest


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

### Key-Value ストア用のテンプレートの構造

Datadog Agent サービスが サービス ディスカバリ用のバックエンドを参照するように設定を済ませた次は、設定用テンプレートを以下の構成で Key-Value ストアに保存する必要があります:

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

上記の構造では、1つのコンテナに対して複数のチェックがあることに注意してください。たとえば、 HTTP チェックとJMX統合を同時に使用して、 HTTP API を提供するJavaサービスを実行できます。テンプレートで宣言するには、単に `check_names`、`init_configs`、 `instances lists` に要素を追加します。これらの要素は、それぞれのリストのインデックスに基づいて一致します。


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

### 例: Apache Webサーバ

デフォルトでは、 Datadog Agent は[`conf.d/auto_conf/apache.yaml` file](https://github.com/DataDog/dd-agent/blob/master/conf.d/auto_conf/apache.yaml)を介してApache Web Serverのサービス検出をサポートしています :

    docker_images:
      - httpd

    init_config:

    instances:
      - apache_status_url: http://%%host%%/server-status?auto

同じ構成テンプレートをetcdに保存するには、次のコマンドを実行します:

    etcdctl mkdir /datadog/check_configs/httpd
    etcdctl set /datadog/check_configs/httpd/check_names '["apache"]'
    etcdctl set /datadog/check_configs/httpd/init_configs '[{}]'
    etcdctl set /datadog/check_configs/httpd/instances '[{"apache_status_url": "http://%%host%%/server-status?auto"}]'


<!-- ### Image name format in the configuration store

Before version `5.8.3` of the Datadog Agent it was required to truncate the image name to its minimum. e.g. for the Docker image `quay.io/coreos/etcd:latest` the key in the configuration store needed to be `datadog/check_configs/etcd/...`

To make configuration more precise we now use the complete container image identifier in the key. So the agent will look in `datadog/check_configs/quay.io/coreos/etcd:latest/...`, and fallback to the old format if no template was found to ensure backward compatibility. -->

### 構成ストア内のイメージ名のフォーマット

Datadog Agentのバージョン `5.8.3` より前では、イメージ名を最小限にする必要がありました。 例えば Docker イメージの `quay.io/coreos/etcd：latest` コンフィギュレーションストア内のキーは `datadog/check_configs/etcd/...` にする必要がありました。

設定をより正確にするために、キー内に完全なコンテナイメージ識別子を使用します。 したがって、 Agent は `datadog/check_configs/quay.io/coreos/etcd:latest/...` で検索し、下位互換性を保証するテンプレートが見つからなければ古いフォーマットにフォールバックします。


<!-- ### Using Docker label to specify the template path

In case you need to match different templates with containers running the same image, it is also possible starting with `5.8.3` to define explicitly which path the agent should look for in the configuration store to find a template using the `com.datadoghq.sd.check.id` label.

For example, if a container has this label configured as `com.datadoghq.sd.check.id: foobar`, it will look for a configuration template in the store under the key `datadog/check_configs/foobar/...`. -->

### Docker ラベルを使用したテンプレート パスの指定

同じイメージを実行するコンテナとは異なるテンプレートをマッチさせる必要がある場合は、 `5.8.3`からエージェントがコンフィギュレーションストアで探すべきパスを明示的に定義し、`com.datadoghq.sd.check.id` ラベル。

たとえば、コンテナのラベルが `com.datadoghq.sd.check.id: foobar`に設定されている場合、ストア内でキー `datadog/check_configs/foobar/...` の下にある設定テンプレートを探します。


<!-- ## Configuration templates with Kubernetes annotations

As of version 5.12 of the Datadog Agent, you can use Kubernetes pod annotations to store your configuration templates. Follow the [Kubernetes integration instructions](/integrations/kubernetes/), then add annotations to your pod definitions. The basic format looks similar to the structure used in the key-value store configuration above, but for Kubernetes it takes the form:

    annotations:
      service-discovery.datadoghq.com/<Kubernetes Container Name>.check_names: '["check_name_0"]'
      service-discovery.datadoghq.com/<Kubernetes Container Name>.init_configs: '[{init_config}]'
      service-discovery.datadoghq.com/<Kubernetes Container Name>.instances: '[{instance_config}]'

Also similar to the key-value store configuration above, you include multiple checks for a container within in the pod. Each element from `check_names`, `init_configs`, and `instances` will be matched together based on their index. In pods with multiple containers, you can simply include additional annotations using the corresponding Kubernetes container name. -->

## Kubernetes アノテーションによる設定テンプレート

Datadog Agent のバージョン5.12では、Kubernetes podアノテーションを使用して設定テンプレートを保存することができます。[Kubernetes integration instructions](/integrations/kubernetes/) に従い、注釈をポッド定義に追加します。基本的なフォーマットは、上記のキーバリューストア構成で使用されている構造に似ていますが、Kubernetesの場合、次の形式があります。

    annotations:
      service-discovery.datadoghq.com/<Kubernetes Container Name>.check_names: '["check_name_0"]'
      service-discovery.datadoghq.com/<Kubernetes Container Name>.init_configs: '[{init_config}]'
      service-discovery.datadoghq.com/<Kubernetes Container Name>.instances: '[{instance_config}]'

また、上記の Key-Value ストア設定と同様に、ポッド内のコンテナに対して複数のチェックを行います。 `check_names`、`init_configs`、そして `instances` の各要素は、それらのインデックスに基づいて一緒にマッチします。複数のコンテナを持つポッドでは、対応する Kubernetes コンテナ名を使用して注釈を追加するだけです。


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

### 例: Apache Web サーバ

次に、設定テンプレート [`conf.d/auto_conf/apache.yaml` file](https://github.com/DataDog/dd-agent/blob/master/conf.d/auto_conf/apache.yaml) に対応するApache YAMLファイルの例を示します：

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
            - containerPort: 80
