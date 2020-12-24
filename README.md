
1.アプリケーションの概要
　このアプリケーションは普段から多くの書籍を読んでいる読書家の方をターゲットとした、読んだ本の内容を
簡単にアウトプット＆記録できるサービスです。

2.使用技術
　・開発環境： AWS
　・言語：HTML, CSS, Ruby 2.6.3
　・フレームワーク： Ruby on Rails 5.1.6
　・データベース： SQlite3
　・ツール： Git, Bitbucket
　・本番環境： heroku 7.47.5
　・テスト： RSpec 3.7
　
3.アプリケーションの機能
　・新規登録
　・ユーザーのログイン、ログアウト
　・投稿
　・画像投稿
　・投稿一覧
　・ユーザー一覧
　・投稿検索
　・いいね！
　・ユーザーの編集
　・投稿の編集、削除
　・ユーザーの投稿、いいね！の表示
　・ページネーション(will_paginate)
　
4.工夫した点
　・RSpecによるバグの検知、未然防止を行った点。
　・親しい友人にサービスを使ってもらって、機能を改善した点。
　
5.制作にあたって苦労した点
　・herokuデプロイ時のエラー処理。
　    ユーザー画像の表示に関連するページだけなぜか本番環境でのみ動作しなくなり、エラーの解決に丸二日を要した。
　　　しかし、最終的にはQiita等で調べて解決できた。
　・テスト駆動開発でのテストエラー
　　　最初はRSpecの使い勝手がわからず、ブラウザテストでエラーが頻出。
　　　
6.学んでいること
　・SQLを中心としたデータベースまわりの知識。
　　　Railsを使用することでSQLの理解が浅くてもアプリケーションを形としては開発できてしまっていたので、
　　　裏でどのようなSQL文が発行されているかなどの理解に努めている。
　
7.この先やってみたいこと
　・実際にユーザーに使ってもらえるサービスに関わりたい。
　・先々はプロダクト制作の中心メンバーとして、サービスに関わっていきたい。