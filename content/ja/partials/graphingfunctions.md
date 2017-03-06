
関数                    | カテゴリ        | 概要
-----------------------|---------------|-------------------
`abs()`                | Arithmetic    | absolute value
`log2()`               | Arithmetic    | base-2 logarithm
`log10()`              | Arithmetic    | base-10 logarithm
`cumsum()`             | Arithmetic    | cumulative sum over visible time window
`integral()`           | Arithmetic    | cumulative sum of (\[time delta] x \[value delta]) over all consecutive pairs of points in the visible time window
`.fill()`              | Interpolation | choose how to interpolate missing values
`hour_before()`        | Timeshift     | metric values from one hour ago
`day_before()`         | Timeshift     | metric values from one day ago
`week_before()`        | Timeshift     | metric values from one week ago
`month_before()`       | Timeshift     | metric values from one month ago
`per_second()`         | Rate          | the rate at which the metric changes per second
`per_minute()`         | Rate          | <code>per_second()</code> * 60
`per_hour()`           | Rate          | <code>per_second()</code> * 3600
`dt()`                 | Rate          | time delta between points
`diff()`               | Rate          | value delta between points
`derivative()`         | Rate          | 1st order derivative; <code>diff()</code> / <code>dt()</code>
`ewma_3()`             | Smoothing     | exponentially weighted moving average with a span of 3
`ewma_5()`             | Smoothing     | EWMA with a span of 5
`ewma_10()`            | Smoothing     | EWMA with a span of 10
`ewma_20()`            | Smoothing     | EWMA with a span of 20
`median_3()`           | Smoothing     | rolling median with a span of 3
`median_5()`           | Smoothing     | rolling median with a span of 5
`median_7()`           | Smoothing     | rolling median with a span of 7
`median_9()`           | Smoothing     | rolling median with a span of 9
`.rollup()`            | Rollup        | override default time aggregation type and time period; see the "Rollup" section below for details
`count_nonzero()`      | Count         | count all the non-zero values
`count_not_null()`     | Count         | count all the non-null values
`top()`                | Rank          | select the top series responsive to a given query, according to some ranking method; see the "Top functions" section below for more details
`top_offset()`         | Rank          | similar to `top()`, except with an additional offset parameter, which controls where in the ordered sequence of series the graphing starts. For example, an offset of 2 would start graphing at the number 3 ranked series, according to the chosen ranking metric.
`robust_trend()`       | Regression    | fit a robust regression trend line using Huber loss; see the "Robust regression" section below for more details
`trend_line()`         | Regression    | fit an ordinary least squares regression line through the metric values
`piecewise_constant()` | Regression    | approximate the metric with a piecewise function composed of constant-valued segments
`anomalies()`          | Algorithms    | overlay a gray band showing the expected behavior of a series based on past behavior; see our [guide to anomaly detection](/guides/anomalies)
`outliers()`           | Algorithms    | highlight outlier series; see our [guide to outlier detection](/guides/outliers)
{:.table}

**`.as_count()` & `.as_rate()`**

これらの関数は、statsdを使用して rate 又は counter として送信されたメトリックを対象としています。 これらの関数を設定しても、他のメトリック タイプには影響を及ぼしません。 `.as_count()`と`.as_rate()` の使用方法の詳細については、[ブログの記事](https://www.datadoghq.com/blog/visualize-statsd-metrics-counts-graphing/)をご覧ください。

**Rollup**

`.rollup()` は、 Datadog でデータ ポイントがどのように扱われているかを理解しているユーザにのみお勧めの関数です。この関数をクエリの最後尾に追加することで、グラフ上にプロットされる一つのデータ ポイントが、生のデータ ポイントの何個分を集計した結果なのかを制御することができます。この関数は、メソッドと時間を引き通として受け付けます: `.rollup(method,time)`

設定できるメソッドは、sum/min/max/count/avgで、時間は秒単位です。どちらか一つを指定することも可能です。又、 `.rollup(sum,120)` のように両方を一度に指定することもできます。 Datadog のグラフ上では、 350 データ ポイントの表示可能データ ポイントの制限を課しています。例えば、一ヶ月の期間を表示するグラフで `.rollup(20)` を使ってデータ ポイントを表示しようとしている場合、先の 350 データ ポイントの制限に収まるように 20 秒より長い時間で rollup したデータを返しています。

**Top functions**

取り扱う時系列データを制限します。

* この関数で取り扱えるメトリック クエリは、次のようになります。グループ化することもできます。 例: ```avg:system.cpu.idle{*} by {host}```
* クエリの次に表示されている整数は、表示に使う時系列データの数になります。
* one of ```'max'```, ```'min'```, ```'last'```, ```'l2norm'```, or ```'area'```.  ```'area'``` is the signed area under the curve being graphed, which can be negative.  ```'l2norm'``` uses the <a href="http://en.wikipedia.org/wiki/Norm_(mathematics)#p-norm">L2 Norm</a> of the time series, which is always positive, to rank the series.
* either ```'desc'``` (rank the results in descending order) or ```'asc'``` (ascending order).
* ```'desc'``` は、降順で結果をランク付けします。 ```'asc'``` は、昇順で結果をランク付けします。

```top()``` 関数には、次の形式の表現もあります。
これらの関数は、 single series list に対して適用することができます。

```[top, bottom][5, 10, 15, 20]_[mean, min, max, last, area, l2norm]()```

例えば ```bottom10_min()``` は、'min'メトリックを使ってリスト化した際の下位か10個のシリーズを取得してきます。


**Robust regression**

Anonaly の検知で最も一般的なタイプの線形回帰は、ordinary least squares (OLS)です。この方法は、極端な値を持つ少数のポイントによって大きく影響を受けることがあります。Robust regression は、少数の極値の影響を最小限に抑えた線形回帰を実現するための代替法です。例として、以下のプロットを参照してください。 素のメトリックは、青色の実線です。紫色の破線はOLS回帰線で、黄色の破線は Robust regression です。単発で派生した短いスパイクは、OLSの回帰線を上向きにしますが、 Robust regression の回帰線は、スパイクを無視し、メトリック全体の傾向に添って推移してくれます。

<img src="/static/images/robust-trend.png" style="width:700px; border:1px solid #777777"/>
