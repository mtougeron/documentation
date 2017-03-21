---
last_modified: 2017/03/21
translation_status: progess
language: ja
title: Datadog-Elastic Beanstalk インテグレーション
integration_title: AWS Elastic Beanstalk
kind: integration
newhlevel: true
---

<!-- AWS Elastic Beanstalk is an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS.

### Monitor Elastic Beanstalk environments with the Datadog agent container
If you use Docker containers in a Beanstalk environment, and want to monitor your Docker usage in this environment, the containerized Datadog agent is a tool of choice.

Read on to understand how to configure your Beanstalk environment to integrate the Datadog agent container.  -->

AWS Elastic Beanstalk は、 Java, .NET, PHP, Node.js, Python, Ruby, Go で開発された Web アプリケーションやサービスや Apache, Nginx, Passenger, IISなどの Docker コンテナをディプロイしスケールアウトするための簡単に使えるサービスです。

# Datadog Agent コンテナによる Elastic Beanstalk 環境の監視

Beanstalk 環境で Docker コンテナを採用し、この環境での Docker の使用状況を監視したい場合、監視用 Agent にはコンテナ化された Datadog Agent が最も適しています。

Beanstalk 環境を設定し、Datadog Agnet コンテナがディプロイされるようにするには、以下の"タスクの定義"の部分を参照してください。


<!-- #### Task definition
To run docker environments with multiple containers per instance, Elastic Beanstalk relies on Amazon EC2 Container Service (ECS).
For this reason you need to describe the containers you want to deploy the ECS-way. Elastic Beanstalk allows you to do so through a file called `Dockerrun.aws.json`.

A `Dockerrun.aws.json` file is an Elastic Beanstalk–specific JSON file that describes how to deploy a set of Docker containers as an Elastic Beanstalk application. You can use this file for a multicontainer Docker environment.

`Dockerrun.aws.json` describes the containers to deploy to each container instance in the environment as well as the data volumes to create on the host instance for the containers to mount.

A `Dockerrun.aws.json` file can be used on its own or zipped up with additional source code in a single archive. Source code that is archived with a `Dockerrun.aws.json` is deployed to container instances and accessible in the `/var/app/current/` directory. Use the `volumes` section of the config to provide mount points for the containers running on the instance, and the `mountPoints` section of the embedded container definitions to mount them from the containers.

The following snippet illustrates a `Dockerrun.aws.json` declaring the Datadog agent. Update it with the definition of your containers to define your own `Dockerrun.aws.json`. This file can be zipped with additional content to send to the instances which run the described containers, and shipped to Beanstalk. For more info about the syntax of this file you can refer to [the Beanstalk documentation](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker_v2config.html).

~~~~~~~~
{
  "AWSEBDockerrunVersion": 2,
  "volumes": [
    {
       "name": "docker_sock",
       "host": {
            "sourcePath": "/var/run/docker.sock"
      }
    },
    {
       "name": "proc",
       "host": {
            "sourcePath": "/proc/"
      }
    },
    {
       "name": "cgroup",
       "host": {
            "sourcePath": "/cgroup/"
      }
    }
  ],
  "containerDefinitions": [
    {
      "name": "dd-agent",
      "image": "datadog/docker-dd-agent:latest",
      "environment": [
            {
              "name": "API_KEY",
              "value": "your_api_key"
            },
            {
              "name": "TAGS",
              "value": "simple-tag-0, tag-key-1:tag-value-1"
            }
      ],
      "memory": 128,
      "mountPoints": [
        {
          "sourceVolume": "docker_sock",
          "containerPath": "/var/run/docker.sock",
          "readOnly": false
        },
        {
          "sourceVolume": "proc",
          "containerPath": "/host/proc",
          "readOnly": true
        },
        {
          "sourceVolume": "cgroup",
          "containerPath": "/host/sys/fs/cgroup",
          "readOnly": true
        }
      ]
    }
  ]
}
~~~~~~~~ -->

## タスクの定義

インスタンス毎に複数のコンテナが存在する Docker 環境を起動するのに Elastic Beanstalk は、Amazon EC2 コンテナ サービス (ECS) の機能を使っています。

このため、ECS の方式で配置するコンテナを記述する必要があります。Elastic Beanstalk の場合、 `Dockerrun.aws.json` というファイルを使用することができます。

`Dockerrun.aws.json` ファイルは、 Elastic Beanstalk 固有の JSON ファイルで、一連の Docker コンテナを Elastic Beanstalk アプリケーションとしてデプロイする方法を記述しています。そしてこのファイルは、マルチ コンテナの Docker 環境にも使用することができます。

`Dockerrun.aws.json` は、構築しようとしている環境内の各コンテナ インスタンスに配置するコンテナと、コンテナがマウントするためのホスト インスタンス上に作成するデータ ボリュームの内容を記述します。

`Dockerrun.aws.json` ファイルはそのままでも、又、追加のソースコードを同胞し、一つの圧縮ファイルに保存し使用することもできます。 `Dockerrun.aws.json` と共の圧縮されたソースコードは、コンテナ インスタンスの `/var/app/current/` ディレクトリに展開され、アクセスすることが可能です。その設定ファイルの `volumes` セクションを使ってインスタンス上で動作するコンテナのマウントポイントを設定し、コンテナへの組み込み定義の `mountPoints` セクションによりコンテナからそれらをマウントするようにします。

以下は、 Datadog Agent を定義するための `Dockerrun.aws.json` をスニペットです。
この定期を基にそれぞれのコンテナの内容に合わせて `Dockerrun.aws.json` の定期を更新してください。このファイルは、コンテナ インスタンスに送信し、配置したコンテナで実行する追加コンテンツとともに圧縮し、BeanStalkに送ることができます。ファイルの構文の詳細については、["The Beanstalk documentation"](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker_v2config.html) を参照してください。

~~~~~~~~
{
  "AWSEBDockerrunVersion": 2,
  "volumes": [
    {
       "name": "docker_sock",
       "host": {
            "sourcePath": "/var/run/docker.sock"
      }
    },
    {
       "name": "proc",
       "host": {
            "sourcePath": "/proc/"
      }
    },
    {
       "name": "cgroup",
       "host": {
            "sourcePath": "/cgroup/"
      }
    }
  ],
  "containerDefinitions": [
    {
      "name": "dd-agent",
      "image": "datadog/docker-dd-agent:latest",
      "environment": [
            {
              "name": "API_KEY",
              "value": "your_api_key"
            },
            {
              "name": "TAGS",
              "value": "simple-tag-0, tag-key-1:tag-value-1"
            }
      ],
      "memory": 128,
      "mountPoints": [
        {
          "sourceVolume": "docker_sock",
          "containerPath": "/var/run/docker.sock",
          "readOnly": false
        },
        {
          "sourceVolume": "proc",
          "containerPath": "/host/proc",
          "readOnly": true
        },
        {
          "sourceVolume": "cgroup",
          "containerPath": "/host/sys/fs/cgroup",
          "readOnly": true
        }
      ]
    }
  ]
}
~~~~~~~~


<!-- #### Creating the environment

Once the container definition is ready, the last step is to ship it to Beanstalk.
This step is explained in [the multicontainer Docker tutorial](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker_ecstutorial.html) of the Elastic Beanstalk documentation.
 -->

## 設定した環境を作成する

コンテナの定義が完了したら、最後のステップは、 Beanstalk にその内容を送り込むことです。この手順は、Elastic Beanstalk のドキュメント ["the multicontainer Docker tutorial"](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker_ecstutorial.html) で説明されています。

