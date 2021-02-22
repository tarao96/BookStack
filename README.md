
### 1.アプリケーションの概要
　このアプリケーションは普段から多くの書籍を読んでいる読書家の方をターゲットとした、読んだ本の内容を
簡単にアウトプット＆記録できるサービスです。

### 2.使用技術
- 開発環境： AWS
- 言語：HTML, CSS, Ruby 2.6.3
- フレームワーク： Ruby on Rails 5.1.6
- データベース： SQlite3
- ツール： Git, Bitbucket
- 本番環境： heroku 7.47.5
- テスト： RSpec 3.7
　
### 3.アプリケーションの機能
- 新規登録
- ユーザーのログイン、ログアウト
- 投稿
- 画像投稿(carrierwave)
- 入力フォームの生成(nested_form)
- 投稿一覧
- ユーザー一覧
- 投稿検索
- いいね！(Ajax処理)
- フォロー
- コメント投稿
- ユーザーの編集、削除
- 投稿の編集、削除
- ユーザーの投稿、いいね！、フォロー、フォロワーの表示
- ページネーション(will_paginate)
　
### 4.工夫した点
- RSpecによるバグの検知、未然防止を行った点。
- N+1問題が発生しないように気を付けて実装していた点。
- 親しい友人にサービスを使ってもらって、機能を改善した点。
　
### 5.制作にあたって苦労した点
- 入力フォームの作成
 「Create Point」というボタンをクリックしたときにテキストエリアが生成するという機能を作成していた時に、原因不明のエラーが出て解決に苦労した。
 最終的には、エラーに画像アップロード機能が絡んでいるらしいということを発見し、画像アップロード用ライブラリのcarrierwaveに変更して解決。
- テストエラー頻出時の解決
  最初はRSpecの使い勝手がわからず、ブラウザテストでエラーが頻出した。
  Qiita等で解決していくうちに徐々に慣れていった。
　　　
### 6.学んでいること
- SQLを中心としたデータベースまわりの知識。
- Linux環境でのコマンド操作やRuby,Railsなどのインストールといった環境構築。
- フロント周りが弱いので、CSS,JavaScript,jQueryあたりを勉強中。
　
### 7.この先やってみたいこと
- 実際にユーザーに使ってもらえて役立つサービスに関わりたい。
- 先々はプロダクト制作の中心メンバーとして、サービスに関わっていきたい。
- 将来的にはサービスの設計から関わっていきたい。
