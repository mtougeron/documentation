---
last_modified: 2017/04/03
translation_status: compelte
language: ja
title: Datadog-Microsoft Azure インテグレーション
integration_title: Microsoft Azure
kind: integration
doclevel: complete
newhlevel: true
autotocdepth: 1
---

<!-- ### Overview

Connect to Microsft Azure in order to:

* Get metrics from Azure VMs with or without installing the Agent
* Tag your Azure VMs with Azure-specific information (e.g. location)
* Get metrics for other services: Application Gateway, App Service (Web & Mobile), Batch Service, Event Hub, IOT Hub, Logic App, Redis Cache, Server Farm (App Service Plan), SQL Database, SQL Elastic Pool, and Virtual Machine Scale Set

Related integrations include:

| [App Service](/integrations/azure_app_services) | easy-to-use service for deploying and scaling web, mobile, API and business logic applications |
| [Batch Service](/integrations/azure_batch) | managed task scheduler and processor |
| [Event Hub](/integrations/azure_event_hub) | large scale data stream managed service |
| [IOT Hub](/integrations/azure_iot_hub) | connect, monitor, and manage billions of IOT assets |
| [Logic App](/integrations/azure_logic_app) | quickly build powerful integration solutions |
| [Redis Cache](/integrations/azure_redis_cache) | managed data cache |
| [SQL Database](/integrations/azure_sql_database) | highly scalable relational database in the cloud |
| [SQL Database Elastic Pool](/integrations/azure_sql_elastic_pool) | manage the performance of multiple databases |
| [Virtual Machine](/integrations/azure_vm) | virtual machine management service |
| [Virtual Machine Scale Set](/integrations/azure_vm_scale_set) | deploy, manage, and autoscale a set of identical VMs |
{:.table} -->

# 概要

Connect to Microsft Azure in order to:

* Get metrics from Azure VMs with or without installing the Agent
* Tag your Azure VMs with Azure-specific information (e.g. location)
* Get metrics for other services: Application Gateway, App Service (Web & Mobile), Batch Service, Event Hub, IOT Hub, Logic App, Redis Cache, Server Farm (App Service Plan), SQL Database, SQL Elastic Pool, and Virtual Machine Scale Set

Related integrations include:

| [App Service](/integrations/azure_app_services) | easy-to-use service for deploying and scaling web, mobile, API and business logic applications |
| [Batch Service](/integrations/azure_batch) | managed task scheduler and processor |
| [Event Hub](/integrations/azure_event_hub) | large scale data stream managed service |
| [IOT Hub](/integrations/azure_iot_hub) | connect, monitor, and manage billions of IOT assets |
| [Logic App](/integrations/azure_logic_app) | quickly build powerful integration solutions |
| [Redis Cache](/integrations/azure_redis_cache) | managed data cache |
| [SQL Database](/integrations/azure_sql_database) | highly scalable relational database in the cloud |
| [SQL Database Elastic Pool](/integrations/azure_sql_elastic_pool) | manage the performance of multiple databases |
| [Virtual Machine](/integrations/azure_vm) | virtual machine management service |
| [Virtual Machine Scale Set](/integrations/azure_vm_scale_set) | deploy, manage, and autoscale a set of identical VMs |
{:.table}


# Installation

Integrating Datadog with Microsoft Azure can be done via the Azure Command Line Interface or through the Azure portal

## Integrating through the Azure CLI
To integrate Datadog with Azure using the Azure Command Line Interface, make sure you have [Azure CLI installed][7]. 

First, login to the Azure account you want to integrate with Datadog

~~~~
azure login
~~~~

Next, configure CLI to be in ARM (Azure Resource Manager) mode

~~~~
azure config mode arm
~~~~

Run the account show command and copy & paste the `Tenant ID` value into the form on the Azure setup tile under "Tenant Name"

~~~~
azure account show
~~~~

Create an Active Directory application using the format below.\\
The `name`, `home-page`, and `identifiter-uris` will be NOT used in any way and are simply required as part of the setup process.\\
The `password` you choose must be copy and pasted into the form on the Azure setup tile under "Client Secret"

~~~~
azure ad app create --name "DatadogAuth" --home-page "http://app.datadoghq.com" --identifier-uris "http://app.datadoghq.com" --password "SomePassword"
~~~~

Create a Service Principal using the `AppId` returned from the last command.\\
Copy and paste this `AppId` into the form on the Azure setup tile under "Client ID"

azure cli <0.10.2:

~~~~
azure ad sp create {app-id}
~~~~

azure cli >= 0.10.2:

~~~~
azure ad sp create -a {app-id}
~~~~

Grant the Service Principal the "Reader" role for the subscription you are interested in monitoring.\\
Use the `Object Id` returned from the previous command to fill in `{object-Id}`
`{subscription-Id}` is the azure subscription you would like to monitor, and is listed as `ID` in `azure account show` or through the portal

~~~~
azure role assignment create --objectId {object-Id} --roleName Reader --subscription {subscription-Id}
~~~~


## Integrating through the Azure Portals

1. The first step is <a href="#installation1">Getting your tenant name</a> and passing it to Datadog.
2. The second step is <a href="#installation2">Creating a web application</a> in your Active Directory and passing the correct credentials to Datadog.
3. The third step is <a href="#installation3">Giving this application read-access</a> to any subscriptions you would like to monitor.

### Getting your Tenant Name

1. Navigate to [portal.azure.com][2]
2. In the leftmost blade, select "Azure Active Directory"
3. Under properties, copy the Directory ID Value

    ![settings](/static/images/azure/Azure_tenant_name.png)

4. Paste the ID under "Tenant Name" in the form on the Azure setup tile

    ![settings](/static/images/azure/tenant_name_form.png)

### Creating the Web Application

1. Navigate to the "App Registrations" tab within your Azure Active Directory.
2. Press "Add"
3. Enter a name and Sign-on URL for this app.
  * These will NOT be used in any way and are simply required as part of the setup process.
  * Leave Application "Type as Web app/ API"
4. Press "Create"

    ![settings](/static/images/azure/Azure_create_ad.png)

5. Once it is created, select the App from the list of App Registrations
6. Copy the "Application ID" and paste the value into "Client ID" in the form on the Azure setup tile

    ![settings](/static/images/azure/Azure_client_id.png)

    ![settings](/static/images/azure/client_id_form.png)

7. For the same app, go to "All settings"
8. Go to "Keys"
9. Enter a new Client Secret key and press Save
  * Make sure to note when the key will expire!
10. When the Secret Key is shown, copy and paste it in "Client Secret" in the form on the Azure setup tile

    ![settings](/static/images/azure/Azure_client_secret.png)

    ![settings](/static/images/azure/client_secret_form.png)

11. Click "Install Integration" to complete the application creation process

### Giving Read Permissions to the Application

1. Navigate to “Subscriptions” on the left hand menu

    ![settings](/static/images/azure/subscriptions_icon.png){:style="width:50%;"}

2. Click on the subscription you would like to monitor
3. Click on "Access control (IAM)" in the lefthand menu

    ![settings](/static/images/azure/access_control_button.png){:style="width:50%;"}

4. Click "Add"

    ![settings](/static/images/azure/add_user_button.png){:style="width:50%;"}

5. Select “Reader” as a role

    ![settings](/static/images/azure/reader_icon.png){:style="width:50%;"}

6. Search/select for the name of the Application you just created (i.e. Datadog Auth)
7. Click Select
8. Click OK
9. Repeat this process for any other subscriptions you would like to monitor
10. **Please note that Diagnostics must be enabled for ARM deployed VMs to collect metrics. <a href="#diagnostics">See the instructions below</a>**

**In a few minutes, metrics from applications under that subscription will begin to appear!**

![Azure VM Default Dashboard](/static/images/azure/azure_vm_screenboard.png)
Naviate to the [Azure VM Default Dashboard][6] to see this dashboard populate with your infrastructure's data

Learn more about how to monitor Azure VM performance metrics with [our series of posts](https://www.datadoghq.com/blog/how-to-monitor-microsoft-azure-vms/). We detail the key performance metrics, how to collect them, and how to use Datadog to monitor Azure VMs.



<!-- ### Configure Azure Monitoring -->

# Azure監視機能の設定

<!-- Microsoft Azure supports both PaaS and IaaS (VM) services. Right now Datadog monitoring is tailored for IaaS services. But it can also be installed in worker and web roles. -->

Microsoft Azureは、PaaSのとIaaS(VM)の両方のサービスをサポートしています。現状Datadogの監視は、IaaSのサービスを主たる監視対象として調整されています。しかし、この監視をワーカープロセスやwebサーバまで広げることが出来ます。


<!-- To setup Azure monitoring, go to [Azure integrations][1] and follow instructions on the page. -->

Azureの監視を設定するには、[Azure integrations][1] に移動し、インストラクションタイルに表示される指示に従って下さい。

<!-- #### Enable diagnostics -->

## Diagnostics を有効にする。

<!-- To enable agent-less monitoring, you must enable diagnostics. Right now this is only support by Windows based machines. To do this, first go to [Azure preview portal][2] then follow the instructions below. -->

Datadog Agentをインストールせずに監視するには、Azureのdiagnostics機能を有効にします。現状、この機能はWindowsベースのVMについてのみ対応しています。有効にするには、[Azureのポータル][2]に移動し、次のインストラクションに従って操作をします。

![](/static/images/azure_diag_manual.png)


<!-- After locating your VM:

1. Click on the CPU percentage today panel to show metrics panel
2. Click on Diagnostics
3. Shift the switch to open
4. Click OK to save your changes -->

VMを指定した後の手順:

1. "CPU percentage today"(現状のCPUのパーセンテージ)が表示されているパネルをクリックします。
2. "Diagnostics"をクリックします。
3. Statusスイッチを"ON"にします。
4. "OK"をクリックして設定を保存します。

<!-- Datadog only requires Basic metrics, network and web metrics as well as .Net metrics to function correctly. Un-check logs collection could save you some storage space. -->

Datadogの監視が正しく動作するためには、"Basic metrics", "network and web metrics", ".Net metrics"を有効にする必要があります。更に、"logs collection"のチェックマークを外すことでストレージのスペースを節約することもできます。


<!-- ### Deploy agents -->

# Datadog Agentのインストール

## Azureポータルからのインストール

Datadogは、Azure Extension Managerに対応しています。これにより、AzureのポータルからDatadog Agentをインストールすることが出来ます。Azure上で起動しているVMがWindowsかLinuxに関わらず、ワンクリックでDatadog Agentをインストールすることが出来ます。ワンクリックでのインストールを実行するには、[
Azureのポータル](http://portal.azure.com)から、運用中のVMを選択するか、新しいVMを起動しDatadog Agentの追加をクリックします。

![Azure performance monitoring with One-Click Deployment through Datadog](https://www.datadoghq.com/wp-content/uploads/2015/05/azure-image-4.gif)

インストール手順:

1. 新規または既存の仮想マシンに移動し、`Settings`をクリックします。
2. `Extensions`-> `Add` -> `Datadog` とクリックしていきます。
3. `Create`をクリックし、APIキーを入力します。

[Datadog APIキー](https://app.datadoghq.com/azure/landing/)は、Azureのインテグレーションタイル内で見つけることが出来ます。


## 手作業でのインストール

<!-- You can either deploy agents manually by following the instructions <a href="/guides/azure/">here</a>. -->

次の手順に従って、手作業でDatadog Agentをインストールすることも出来ます。

- [Azure WindowsへDatadog Agentのインストール](/ja//guides/azure/)


<!-- ### Deploy Agents
{: #agents}

1. Follow the steps in the [Azure integrations][1] tile
2. Manually deploy Agents by following the instructions <a href="/guides/azure/">here</a> -->

### Deploy Agents

1. Follow the steps in the [Azure integrations][1] tile
2. Manually deploy Agents by following the instructions <a href="/guides/azure/">here</a>


<!-- ### Metrics

View the specific metrics we collect for each Azure service integration:

* [App Service](/integrations/azure_app_services)
* [SQL Database](/integrations/azure_sql_database)
* [Virtual Machine](/integrations/azure_vm) -->

### メトリクス

View the specific metrics we collect for each Azure service integration:

* [App Service](/integrations/azure_app_services)
* [SQL Database](/integrations/azure_sql_database)
* [Virtual Machine](/integrations/azure_vm)


<!-- ### Troubleshooting
{: #troubleshooting}
Here are some common issues you might be seeing. -->

# トラブルシュート

次に一般的に遭遇しやすいトラブルの対処方法を紹介します。


<!-- #### I don't know my tenant name

1. Navigate to [portal.azure.com][2]
2. In the leftmost blade, select "Azure Active Directory"
3. Under properties, it is the Directory ID

    ![settings](/static/images/azure/Azure_tenant_name.png)

Your tenant name is also available from the URL after navigating to the [classic portal][5]. It is the text in between (**not including**) the @ and # symbol

![settings](/static/images/azure/azure_tenant_url.png) -->

## I don't know my tenant name

1. Navigate to [portal.azure.com][2]
2. In the leftmost blade, select "Azure Active Directory"
3. Under properties, it is the Directory ID

    ![settings](/static/images/azure/Azure_tenant_name.png)

Your tenant name is also available from the URL after navigating to the [classic portal][5]. It is the text in between (**not including**) the @ and # symbol

![settings](/static/images/azure/azure_tenant_url.png)


## Tenent name(テナント名)がわかりません。

Tenent nameを知るためには、まず[Azureのポータル][4]へログインします。その後、スクリーンの左側にあるメニューからSETTINGS(設定)を探し、クリックします。赤枠で囲った部分がTenent name(テナント名)になります。

![](/static/images/azure_tenent.png)

The text in the red box shown in sceenshot above is your tenent name. Please only include text between parentheses. 

<!-- #### Unable to login
If you have experienced an error logging in while trying to install the integration, please reach out to [support@datadoghq.com][3]. When possible, please attach a screenshot. -->

## ログインすることが出来ません。

Azureのインテグレーションをインストールする際にログインすることが出来ない場合は、お気兼ねなく[support@datadoghq.com][3]にお問い合わせ下さい。お問い合わせの際は、スクリーンショット画像の添付をお願いします。


<!-- #### No Metrics Are Showing Up
Please ensure you completed <a href="#installation3">step three</a> of the installation process, which entails giving read permissions to the Azure application (created in <a href="#installation2">step two</a>) for the subscriptions you want to monitor.

For ARM deployed virtual machines, you must also turn on Diagnostics and select the VM metrics you would like to collect. See Enable Diagnostics below for instructions. -->

## メトリクスが表示されません。

### Agentをインストールしていない場合:

VM上でDiagnostics機能が"ON"になっていることを確認して下さい。このDiagnostics機能は、各VMがCPU, Networkなどのログ情報を取得することを許可します。

### Agentをインストールした場合で、Agentからのメトリクスが表示されない場合:

VMが持っている時間が、正しく設定されているか確認して下さい。Datadogに送信されるメトリクス情報に記録されている時間が、現在の時間と大きく離れているとグラフに表示されないことが有ります。


<!-- #### Missing Metrics?
For ARM virtual machines, ensure you have enabled diagnostics and selected the metrics you would like to collect using the instructions below.

For other missing metrics, please reach out to [support@datadoghq.com][3]. -->

## Missing Metrics?
For ARM virtual machines, ensure you have enabled diagnostics and selected the metrics you would like to collect using the instructions below.

For other missing metrics, please reach out to [support@datadoghq.com][3].


<!-- ##### Enable diagnostics
{: #diagnostics}
Turning on Diagnostics allows ARM deployed VMs to collect logging information which includes metrics for CPU, Network, etc. To do this, first go to [Azure Portal][2] then follow the instructions below.

After locating your VM:

1. Click on Diagnostics settings under the Monitoring section
2. Shift the status to On
3. Select the metrics you would like to collect (note: we recommend "Basic metrics", "Network and web metrics", and ".Net metrics". Un-checking logs collection could save you some storage space. Linux Virtual Machines only collect "Basic" and "Boot" diagnostics)
4. Click Save to save your changes

    ![settings](/static/images/azure/azure_enable_diagnostics.png) -->

### Enable diagnostics

Turning on Diagnostics allows ARM deployed VMs to collect logging information which includes metrics for CPU, Network, etc. To do this, first go to [Azure Portal][2] then follow the instructions below.

After locating your VM:

1. Click on Diagnostics settings under the Monitoring section
2. Shift the status to On
3. Select the metrics you would like to collect (note: we recommend "Basic metrics", "Network and web metrics", and ".Net metrics". Un-checking logs collection could save you some storage space. Linux Virtual Machines only collect "Basic" and "Boot" diagnostics)
4. Click Save to save your changes

    ![settings](/static/images/azure/azure_enable_diagnostics.png)


[1]: https://app.datadoghq.com/account/settings#integrations/azure
[2]: https://portal.azure.com
[3]: mailto:support@datadoghq.com
[4]: https://management.azure.com
[5]: https://manage.windowsazure.com
[6]: https://app.datadoghq.com/screen/integration/azure_vm
[7]: https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-install/
