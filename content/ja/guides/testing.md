---
last_modified: 2017/03/01
translation_status: complete
language: ja
title: インテグレーションのテスト
kind: guide
listorder: 6
autotocdepth: 2
---
<style>
.func-p{margin-left:20px;}
.func-code{margin-left:40px;}
</style>

<!-- ### Overview

Automated unit tests help ensure that your integration is working as designed and guard against regression.

Though we don't require tests for each metric collected, we strongly encourage you to provide as much coverage as possible.
-->

### 概要

自動化された単体テストは、インテグレーションが設計通りに機能していることを保証し、意図をしていない機能の劣化を防ぎます。

収集しているメトリック毎にテストは必要ありませんが、可能な限り多くのカバレッジを提供することをお勧めします。


<!--
### Adding Tests

Tests can be easily added by extending the `AgentCheckTest` class. Additionally, you may import Attributes from Nose to manage requirements.

~~~
from nose.plugins.attrib import attr
from tests.checks.common import AgentCheckTest

@attr(requires='network')
class HTTPCheckTest(AgentCheckTest)`
  ...
~~~
-->

### テストの追加

テストは、 `AgentCheckTest` クラスを拡張することで簡単に追加できます。 また、`Nose`から`Attributes`をインポートして要件を管理することもできます。

~~~
from nose.plugins.attrib import attr
from tests.checks.common import AgentCheckTest

@attr(requires='network')
class HTTPCheckTest(AgentCheckTest)`
  ...
~~~


<!-- #### Datadog Integrations

To test integrations, add your test code to the `test_[integration_name].py` file in your integration directory. See the [Integrations Extras documentation](https://github.com/DataDog/integrations-extras/blob/master/readme/README.md#test_my_integrationpy) for more details. -->

#### Datadog のインテグレーション

インテグレーションをテストするには、インテグレーション ディレクトリにある `test_[integration_name].py` ファイルにテストコードを記述してください。詳細に関しては、[Creating New Integrations](/ja/guides/integration_sdk/#testing-your-integrationr) を参照してください。

<!-- #### Datadog Agent Checks

If you are submitting your Agent Check as a Pull Request to be included with the Datadog Agent, please reference the [`README.md` in the dd-agent repository](https://github.com/DataDog/dd-agent/blob/master/tests/README.md). -->

#### Datadog の Agent Check

Datadog Agent 内に組み込む目的で Agent Check の Pull Request を提出する場合は、 dd-agent レポジトリ内の [`README.md`](https://github.com/DataDog/dd-agent/blob/master/tests/README.md) を参照してください。


<!-- ### The AgentCheckTest Class

The following test methods are provided by the `AgentCheckTest` class. For more details about the class, please reference the [source code](https://github.com/DataDog/dd-agent/blob/master/tests/checks/common.py). -->

<!-- ### The AgentCheckTest Class

The following test methods are provided by the `AgentCheckTest` class. For more details about the class, please reference the [source code](https://github.com/DataDog/dd-agent/blob/master/tests/checks/common.py). -->

### AgentCheckTest Class について

以下のテスト関数は、 AgentCheckTest Class 内で定義されています。 この
 Class の詳細については、[ソースコード](https://github.com/DataDog/dd-agent/blob/master/tests/checks/common.py) を参照してください。


<!-- #### Test and Check Status Methods

##### `coverage_report()`

Prints the test coverage status of metrics, events, service checks and service metadata. Also lists items for each that lack test coverage.
{:.func-p}

##### `print_current_state()`

Prints a report of the metrics, events, service checks, service metadata and warnings provided by the integration.
{:.func-p}

#### Run Checks Methods

##### `run_check(config, agent_config=None, mocks=None, force_reload=False)`

Parameters:
{:.func-p}

* **config** (*dictionary*) – A check configuration dictionary containing an array of `instances`. For example:

~~~
{
    'instances': [
        {
            'name': 'simple_config',
            'url': 'http://httpbin.org',
        }
    ]
}
~~~
{:.func-code}

* **agent_config** (*dictionary*) – A customized Datadog agent configuration.
* **mocks** (*dictionary*) – A dictionary keyed by method name (string) with values of method. For example:

~~~
{
    'get_services_in_cluster': self.mock_get_services_in_cluster,
    'get_nodes_with_service': self.mock_get_nodes_with_service,
}
~~~
{:.func-code}

* **force_reload** (*boolean*) – Reload the check before running it.

##### `run_check_twice(config, agent_config=None, mocks=None, force_reload=False)`

Similar to `run_check`, this method will run the check twice with a 1 second delay between runs.
{:.func-p}

##### `run_check_n(config, agent_config=None, mocks=None, force_reload=False, repeat=1, sleep=1)`

Similar to `run_check`, this method will run the check multiple times.
{:.func-p}

Parameters:
{:.func-p}

* **repeat** (*integer*) – The number of times the check will run.
* **sleep** (*integer*) – The delay in seconds between check runs.

#### Metric Methods

##### `assertMetric(metric_name, value=None, tags=None, count=None, at_least=1, hostname=None, device_name=None, metric_type=None)`

Parameters:
{:.func-p}

* **metric_name** (*string*) – The name of the metric.
* **value** (*variable*) – The value for the metric.
* **tags** (*list of strings*) – The tags associated with the metric.
* **count** (*integer*) – The number of candidate metrics the assertion should test for. Typical values are:
  * `None`: will not test for the count
  * `1`: tests for exactly one metric
  * `0`: tests for no matches (works as a negation)
* **at_least** (*integer*) – The minimum number of candidate metrics the assertion should test for.
* **hostname** (*string*) – The name of the host associated with the metric.
* **device_name** (*string*) – The name of the device associated with the metric.
* **metric_type** (*string*) – The type of metric to test for. If set, it must be one of `gauge`, `counter`, `rate`, or `count` as defined by the [checks metric types](https://github.com/DataDog/dd-agent/blob/master/checks/metric_types.py).

##### `assertMetricTagPrefix(metric_name, tag_prefix, count=None, at_least=1)`

Parameters:
{:.func-p}

* **metric_name** (*string*) – The name of the metric.
* **tag_prefix** (*string*) – Match metrics with tags that begin with this string.
* **count** (*integer*) – The number of data points the assertion should test for.
* **at_least** (*integer*) – The minimum number of data points the assertion should test for.

##### `assertMetricTag(metric_name, tag, count=None, at_least=1)`

Parameters:
{:.func-p}

* **metric_name** (*string*) – The name of the metric.
* **tag** (*string*) – The tag associated with the metric.
* **count** (*integer*) – The number of data points the assertion should test for.
* **at_least** (*integer*) – The minimum number of data points the assertion should test for.

#### Service Methods

##### `assertServiceMetadata(meta_keys, count=None, at_least=1)`

Parameters:
{:.func-p}

* **meta_keys** (*list of strings*) – A list of metadata keys.
* **count** (*integer*) – The number of candidate metrics the assertion should test for. Typical values are:
  * `None`: will not test for the count
  * `1`: tests for exactly one metric
  * `0`: tests for no matches (works as a negation)
* **at_least** (*integer*) – The minimum number of candidate metrics the assertion should test for.

##### `assertServiceCheck(service_check_name, status=None, tags=None, count=None, at_least=1)`

##### `assertServiceCheckOK(service_check_name, tags=None, count=None, at_least=1)`

##### `assertServiceCheckWarning(service_check_name, tags=None, count=None, at_least=1)`

##### `assertServiceCheckCritical(service_check_name, tags=None, count=None, at_least=1)`

##### `assertServiceCheckUnknown(service_check_name, tags=None, count=None, at_least=1)`

Parameters:
{:.func-p}

* **service_check_name** (*string*) – The name of the service check.
* **tags** (*list of strings*) – The tags associated with the service check.
* **count** (*integer*) – The number of data points the assertion should test for.
* **at_least** (*integer*) – The minimum number of data points the assertion should test for.


#### Event Method

##### `assertEvent(msg_text, count=None, at_least=1, exact_match=True, tags=None, **kwargs)`

Parameters:
{:.func-p}

* **msg_text** (*string*) – The event message text.
* **count** (*integer*) – The number of candidate metrics the assertion should test for. Typical values are:
  * `None`: will not test for the count
  * `1`: tests for exactly one metric
  * `0`: tests for no matches (works as a negation)
* **at_least** (*integer*) – The minimum number of candidate metrics the assertion should test for.
* **exact_match** (*boolean*) – When true, the event message text must equal `msg_text`. When false, the event message text must contain `msg_text`.
* **tags** (*list of strings*) – The tags associated with the event.
* **kwargs** – Keyword arguments can be used to match additional event attributes.

#### Warning Method

##### `assertWarning(warning, count=None, at_least=1, exact_match=True)`

Parameters:
{:.func-p}

* **warning** (*string*) – The warning message text.
* **count** (*integer*) – The number of candidate warnings the assertion should test for. Typical values are:
  * `None`: will not test for the count
  * `1`: tests for exactly one warning
  * `0`: tests for no matches (works as a negation)
* **at_least** (*integer*) – The minimum number of candidate warnings the assertion should test for.
* **exact_match** (*boolean*) – When true, the warning message text must equal `warning`. When false, the event message text must contain `warning`.

#### Helper Methods

The `AgentCheckTest` class provides some useful test methods that are not specifically related to Datadog metrics and events.

##### `assertIn(first, second)`

##### `assertNotIn(first, second)`

These methods test if the first argument is contained in the second argument using Python's `in` operator.
{:.func-p}

Parameters:
{:.func-p}

* **first** (*multiple types*) – The "needle" data.
* **second** (*multiple types*) – The "haystack" data. -->

#### Test and Check Status 関数

##### `coverage_report()`

metrics, events, service checks, service metadata のテスト カバレッジを出力します。更に、テストを実施ができていない項目のリストを出力します。
{:.func-p}

##### `print_current_state()`

metrics, events, service checks, service metadata 値と、インテグレーションが出している warning 情報を出力します。
{:.func-p}

#### Run Checks 関数

##### `run_check(config, agent_config=None, mocks=None, force_reload=False)`

パラメータ:
{:.func-p}

* **config** (*dictionary*) – 辞書形式の `instances` に関する情報。複数要素になる可能性がある場合はリスト形式で指定する。以下が参考例です。

~~~
{
    'instances': [
        {
            'name': 'simple_config',
            'url': 'http://httpbin.org',
        }
    ]
}
~~~
{:.func-code}

* **agent_config** (*dictionary*) – Datadog agent のカスタマイズ設定。
* **mocks** (*dictionary*) – 辞書形式の関数名(string)によるkeyと、その関数に使う値によるvalueのペア。以下が参考例です。

~~~
{
    'get_services_in_cluster': self.mock_get_services_in_cluster,
    'get_nodes_with_service': self.mock_get_nodes_with_service,
}
~~~
{:.func-code}

* **force_reload** (*boolean*) – 実行の前に、check をリロードを実行します。

##### `run_check_twice(config, agent_config=None, mocks=None, force_reload=False)`

`run_check` と同じです。但し、この関数は、一秒間の間隔を空けてcheck を二回実行します。
{:.func-p}

##### `run_check_n(config, agent_config=None, mocks=None, force_reload=False, repeat=1, sleep=1)`

`run_check` と同じです。但し、この関数は、check を 指定数分実行します。
{:.func-p}

パラメータ:
{:.func-p}

* **repeat** (*integer*) – check を実行する回数。
* **sleep** (*integer*) – check を実行した後、次の check を実行するまでの秒数。

#### Metric 関数

##### `assertMetric(metric_name, value=None, tags=None, count=None, at_least=1, hostname=None, device_name=None, metric_type=None)`

パラメータ:
{:.func-p}

* **metric_name** (*string*) – メトリックの名前。
* **value** (*variable*) – メトリックの値。
* **tags** (*list of strings*) – メトリックに付与したタグ。
* **count** (*integer*) – assertion が、抽出したメトリックの候補数をテストする値。

  値の典型例は:

  * `None`: 候補数のテストはしない。
  * `1`: 候補が一つしかないことをテスト。
  * `0`: マッチする候補がないことをテスト。(否定として使う)
* **at_least** (*integer*) – assertion がテストをする際のメトリックの最低候補値。
* **hostname** (*string*) – メトリックの付与するホスト名。
* **device_name** (*string*) – メトリックに付与するディバイアス名。
* **metric_type** (*string*) – テストをするメトリックのタイプ。この項目を指定する場合は、次の `gauge`, `counter`, `rate`, `count` のどれかを選択してください。 [checks metric types](https://github.com/DataDog/dd-agent/blob/master/checks/metric_types.py).

##### `assertMetricTagPrefix(metric_name, tag_prefix, count=None, at_least=1)`

パラメータ:
{:.func-p}

* **metric_name** (*string*) – メトリックの名前。
* **tag_prefix** (*string*) – タグを使ってメトリックを抽出するためのタグの開始文字列。
* **count** (*integer*) – assertion がテストを実施するデータポイントの数。
* **at_least** (*integer*) – assertion がテストを実施するデータポイントの最低数。

##### `assertMetricTag(metric_name, tag, count=None, at_least=1)`

パラメータ:
{:.func-p}

* **metric_name** (*string*) – メトリックの名前。
* **tag** (*string*) – メトリックに付与したタグ。
* **count** (*integer*) – assertion がテストを実施するデータポイントの数。
* **at_least** (*integer*) – assertion がテストを実施するデータポイントの最低数。

#### Service 関数

##### `assertServiceMetadata(meta_keys, count=None, at_least=1)`

パラメータ:
{:.func-p}

* **meta_keys** (*list of strings*) – メタデータ keys のリスト。
* **count** (*integer*) – assertion が、抽出したメタデータの補数をテストする値。

  値の典型例は:

  * `None`: 候補数のテストはしない。
  * `1`: 候補が一つしかないことをテスト。
  * `0`: マッチする候補がないことをテスト。(否定として使う)
* **at_least** (*integer*) – assertion がテストするべきメトリック候補の最低数。

##### `assertServiceCheck(service_check_name, status=None, tags=None, count=None, at_least=1)`

##### `assertServiceCheckOK(service_check_name, tags=None, count=None, at_least=1)`

##### `assertServiceCheckWarning(service_check_name, tags=None, count=None, at_least=1)`

##### `assertServiceCheckCritical(service_check_name, tags=None, count=None, at_least=1)`

##### `assertServiceCheckUnknown(service_check_name, tags=None, count=None, at_least=1)`

パラメータ:
{:.func-p}

* **service_check_name** (*string*) – service check の名前。
* **tags** (*list of strings*) – service check に付与したタグ。
* **count** (*integer*) – assertion がテストするべきデータポイントの数。
* **at_least** (*integer*) – assertion がテストを実施するデータポイントの最低数。


#### Event 関数

##### `assertEvent(msg_text, count=None, at_least=1, exact_match=True, tags=None, **kwargs)`

パラメータ:
{:.func-p}

* **msg_text** (*string*) – イベント メッセージのテキスト。
* **count** (*integer*) – assertion が、抽出したイベントの候補数のテストをする値。

  値の典型例は:

  * `None`: 候補数のテストはしない。
  * `1`: 候補が一つしかないことをテスト。
  * `0`: マッチする候補がないことをテスト。(否定として使う)
* **at_least** (*integer*) – assertion がテストするイベントの候補の最低数。 
* **exact_match** (*boolean*) – "true" の場合、 `msg_text` と完全に一致していることを確認します。 "false" の場合、イベントメッセージに `msg_text` が含まれれているかを確認します。

* **tags** (*list of strings*) – イベントに付与したタグ。
* **kwargs** – キーワード引数を使用して、追加のイベント属性を照合することができます。


#### Warning 関数

##### `assertWarning(warning, count=None, at_least=1, exact_match=True)`

パラメータ:
{:.func-p}

* **warning** (*string*) – warning メッセージのテキスト。
* **count** (*integer*) – assertion が、抽出したwarningの候補数をテストする値。

  値の典型例は:

  * `None`: 候補数のテストはしない。
  * `1`: 候補が一つしかないことをテスト。
  * `0`: マッチする候補がないことをテスト。(否定として使う)
* **at_least** (*integer*) – assertion がテストする warning の候補の最低数。 
* **exact_match** (*boolean*) – "true" の場合、 `msg_text` と完全に一致していることを確認します。 "false" の場合、warning メッセージに `msg_text` が含まれれているかを確認します。

#### Helper 関数

`AgentCheckTest` class では、Datadog の metrics や events のハンドリングには特に関係がないが、テストの際に便利な関数も提供しています。

##### `assertIn(first, second)`

##### `assertNotIn(first, second)`


これらの関数は、 Python の `in` 演算子を使って第1引数が第2引数に含まれているかをテストします。
{:.func-p}

パラメータ:
{:.func-p}

* **first** (*multiple types*) – 含まれていることを確認するデータ 例 "needle" data: [a, ab]
* **second** (*multiple types*) – 全体データ  例 "haystack" data: [a, b, c, d, e, ab, bc, ae]


<!-- ### Examples

#### Datadog Integrations

For further examples of testing Datadog integrations, you can view the test files for [core integrations](https://github.com/DataDog/integrations-core) such as the [`test_mysql.py` file](https://github.com/DataDog/integrations-core/blob/master/mysql/test_mysql.py) for the MySQL integration. -->

### 参考例

#### Datadog のインテグレーション

Datadog インテグレーションのテスト方法について更に詳しい知りたい場合は、 MySQL インテグレーションの `test_mysql.py` など、[コアなインテグレーション](https://github.com/DataDog/integrations-core)に使っているのテスト ファイルを参照してください。


<!-- #### Datadog Agent Checks

For examples of Agent Check tests, you can view the test files for [agent checks](https://github.com/DataDog/dd-agent/tree/master/tests/checks/integration) such as [`test_http_check.py` file](https://github.com/DataDog/integrations-core/blob/master/http_check/test_http_check.py). -->

#### Datadog の Agent Checks

Agent Check のテストの参考例については、[`test_http_check.py`](https://github.com/DataDog/integrations-core/blob/master/http_check/test_http_check.py) ファイルなどの [agent check](https://github.com/DataDog/dd-agent/tree/master/tests/checks/integration) 用のテストファイルを表示してください。







