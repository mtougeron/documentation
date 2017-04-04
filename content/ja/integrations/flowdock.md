---
last_modified: 2017/04/04
translation_status: complete
language: ja
title: Datadog-Flowdock インテグレーション
integration_title: Flowdock
kind: integration
doclevel: basic
newhlevel: true
---

<!-- Integrate with FlowDock to:

* be notified when someone posts on your stream
* get monitor alerts, integration status changes (and much more) directly in your flows

Datadog takes advantage on Flowdock's Threads to avoid polluting your flows with notifications: for a given flow, every notification will go in it's own Thread, further related notifications will go in that same thread (for instance if a given monitor alert is triggered and then resolved, the corresponding notifications will be grouped in Flowdock). -->

Integrate with FlowDock to:

* be notified when someone posts on your stream
* get monitor alerts, integration status changes (and much more) directly in your flows

Datadog takes advantage on Flowdock's Threads to avoid polluting your flows with notifications: for a given flow, every notification will go in it's own Thread, further related notifications will go in that same thread (for instance if a given monitor alert is triggered and then resolved, the corresponding notifications will be grouped in Flowdock).

FlowDockとの統合：

* 誰かがあなたのストリームに投稿したときに通知を受ける
* モニタのアラート、統合状況の変更などをフローに直接表示する

DatadogはFlowdockのスレッドを利用して、通知のフローを汚染しないようにします。特定のフローでは、すべての通知が自身のスレッドに入り、さらに関連する通知が同じスレッドに入ります（たとえば、特定の監視アラートがトリガーされ、  、対応する通知はFlowdockでグループ化されます）。


<!-- # Hands-off integration

Integrating flowdock is really straightforward. You just have to log into Flowdock on the Configuration tab. It will fetch all your opened flows. If you don't want to post to all of them, you can delete the ones you don't want to appear in the autocomplete list. You can then use @flowdock handles in any user message or monitor to post messages to your flows.

User messages and snapshots will go in the main thread of your flow while each alert will be posted in its own Flowdock thread. It prevents the main thread from being overpolluted with alerts and keeps your team chat clean and organized. On the other hand, you always have an immediate glance at the statuses of the monitors which reported recently on the Inbox view. -->

# Hands-off integration

Integrating flowdock is really straightforward. You just have to log into Flowdock on the Configuration tab. It will fetch all your opened flows. If you don't want to post to all of them, you can delete the ones you don't want to appear in the autocomplete list. You can then use @flowdock handles in any user message or monitor to post messages to your flows.

User messages and snapshots will go in the main thread of your flow while each alert will be posted in its own Flowdock thread. It prevents the main thread from being overpolluted with alerts and keeps your team chat clean and organized. On the other hand, you always have an immediate glance at the statuses of the monitors which reported recently on the Inbox view.

＃ハンズオフ との連携

フロードックの統合は本当に簡単です。  「設定」タブの「Flowdock」にログインするだけです。 開かれたすべてのフローを取得します。 すべてに投稿したくない場合は、オートコンプリートリストに表示したくないものを削除することができます。 任意のユーザーメッセージまたはモニターで@flowdockハンドルを使用して、フローにメッセージをポストすることができます。

ユーザのメッセージとスナップショットはフローのメインスレッドに入りますが、各アラートは独自のFlowdockスレッドにポストされます。 これは、メインスレッドが警告で過多になるのを防ぎ、チームチャットをきれいに整理します。 一方、最近、受信トレイビューで最近報告されたモニターの状態を常に一目で把握できます。

