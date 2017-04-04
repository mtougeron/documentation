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

以下の目的で、 FlowDock と連携します：

* 誰かがあなたのストリームに投稿したときに通知を受ける
* モニタのアラートやインテグレーションの状況変更などを、 Flowdock のフローに表示する

Datadog は、Flowdock のスレッド機能を利用し、通知でメイン フローを埋め尽くさないようにします: 全ての通知は自身のスレッドに入り、さらに関連する通知も同じスレッドに入ります。（例えば、特定の監視アラートが検知/通知され、後に解消/通知された場合、対応する全通知は Flowdock の同じグループに分類されます。）


<!-- # Hands-off integration

Integrating flowdock is really straightforward. You just have to log into Flowdock on the Configuration tab. It will fetch all your opened flows. If you don't want to post to all of them, you can delete the ones you don't want to appear in the autocomplete list. You can then use @flowdock handles in any user message or monitor to post messages to your flows.

User messages and snapshots will go in the main thread of your flow while each alert will be posted in its own Flowdock thread. It prevents the main thread from being overpolluted with alerts and keeps your team chat clean and organized. On the other hand, you always have an immediate glance at the statuses of the monitors which reported recently on the Inbox view. -->

# 設定

Flowdock との連携は、非常に簡単です。先ず、Datadog の [Flowdock インテグレーション タイル][1]の "Configuration" タブを選択し、ポップアップから "Sign in with Flowdock" をクリックしログインします。 Flowdock インテグレーションが、Flowdock 内の flow の情報を集取し、Datadog 側に登録した後、ポップアップ内に flow のリスト表示します。ポップアップ内に表示された flow で不要なものは、赤い進入禁止マークをクリックして削除することができます。この状態で、イベント ストリームや Monitor(アラート) のメッセージ欄に @flowdock-`flow名`の書式で文字列を入力すると Flowdock にメッセージが送信できます。

ユーザ メッセージとスナップショットは flow のメイン スレッドに入ります。アラートから送信されたメッセージは、独自の Flowdock スレッドにポストされます。このことにより、メイン スレッドがアラートで埋め尽くされるのを防ぎ、チーム チャットを本来の姿に維持します。一方で、Inbox ビューは、直近に通知された Monitor(アラート) の状態を常に一目で把握できるようになっています。

[1]: https://app.datadoghq.com/account/settings#integrations/flowdock
