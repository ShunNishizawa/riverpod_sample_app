# riverpod_sample_app

- riverpodの学習記録用リポジトリです

## Providerの種類

### Provider

- 最も基本的なやつ。外部から変更できない値を公開できる
- Providerの内部から変更でき、`watch`していればその変更は再構築される

### riverpod_generator

- メソッドの戻り値によって`Provider`や`FutureProvider`など適切なプロバイダを生成してくれる
- プロバイダの`Hot-reload`が可能になる

### StateProvider

- 外部から変更可能な状態を提供する

### StateNotifierProvider

- 外部から変更可能な状態と、状態操作メソッドクラスを提供する
- 単純な状態の保持だけでなく、ユーザ操作などにより、変化するステートを管理する。

### (Async)NotifierProvider

- 外部から変更可能な状態と、状態操作メソッドクラスを提供する
- Riverpod ver2以降は`StateNotifireProvider`ではなくこちらの使用を推奨されている
- 使用用途
    - 時間の経過とともに変化する可能性のある状態を後悔する
    - 長期的な保守性を向上させるために、状態を操作する非同期ビジネスロジックを１箇所に集中させる

AsyncNotifireProvider
- `Future`(非同期)な`State`(状態)とそれを操作するAsyncNotifireを提供する

### FutureProvider

- 非同期で取得した値を提供する
- HTTPリクエストやファイルの読み取り、その他Futureを取り扱う処理全般で使用する

### StreamProvider

- 断続的に最頻の値を提供する

### ChangeNotifierProvider

- 変更可能な状態を持つクラスを提供する

### Consumer Widget

- flutter_riverpodで利用する方ではない
- `StatelessWidget`など、buildメソッドに`WidgetRef`を持たないWidgetでも局所的に`WidgetRef`を利用することできるようになるWidget

### Widgetの再構築が不要な場面では・・・

- プロバイダの値を取得して、画面に反映・更新させたい場合は`ref.watch`を使用する
- 再構築不要な場合は`ref.read`を利用する
  - 不要な再構築を避ける

- Widgetのbuildメソッド内では利用しない。あくまで、ボタンが押された時の動作など、再構築とは関係のない箇所でのみ利用する

### ref.listen
- プロバイダーの状態が変更されたとき、その変更を検知して画面遷移やダイアログ表示をさせたい時に利用する

### ref.refresh/invalidate

- `FutureProvider`を利用した際、WebAPIから値を１度取得した後に、もう一度非同期処理を実行して、最新の値を取得したい時に利用する

- `invalid`:プロバイダーを直ちに無効化（破棄）する
- `refresh`:プロバイダーを直ちに再評価（破棄）し、取得した値を返す

### autoDispose修飾子

- そのProviderへの参照がなくなった時、自動でそのProviderが破棄されるようになる
- 再度、参照された際は新たなProviderとして構築されるので、以前のProviderの状態は引き継がない
