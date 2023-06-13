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

### FutureProvider

- 非同期で取得した値を提供する
- HTTPリクエストやファイルの読み取り、その他Futureを取り扱う処理全般で使用する

### StreamProvider

- 断続的に最頻の値を提供する

### ChangeNotifierProvider

- 変更可能な状態を持つクラスを提供する
