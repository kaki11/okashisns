
## アプリについて
お菓子・パンの画像投稿サイトです。  
http://3.115.165.219/  

testユーザーでログイン可能です。  
メールアドレス：test@gmail.com  
パスワード：123456  

## 経緯
お菓子・パンに特化した気軽に交流できる投稿サイトが作りたかったので作成しました。

###### こだわり
未登録のユーザーでもコメント投稿できるようにしています。検索やリンクなど分かりやすいデザインにしました。また技術面で、AWSを使ったデプロイ、capistranoで自動デプロイの設定、RSpecでテストを書きCircleCIを設定しました。


## 実装機能
 - ログイン機能
 - 投稿・削除機能
 - コメント投稿・削除機能
 - お気に入り機能
 - フォロー機能
 - 一覧表示機能
 - 楽天APIを使ったレシピランキング表示
 - 検索機能
 - 単体テスト
 - circleCIでの自動テスト
 
[![CircleCI](https://circleci.com/gh/kaki11/okashisns.svg?style=svg)](https://circleci.com/gh/kaki11/okashisns)


###### 実装予定機能
 - LINEログイン連携
 - レシピ投稿
 - 統合テスト



## 使用技術 -version
 - Ruby 2.5.1
 - Ruby on Rails 5.2.3
 - Mysql 5.7.27
 - capistrano 
 - AWS（EC2+S3）
 - RSpec 

 
