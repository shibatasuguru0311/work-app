
# README





<br>
<br>

## ワークショップマッチングアプリを作成しました。
![35e3b046d73a716e2857bc471c62b778](https://user-images.githubusercontent.com/67133171/93013212-44dcf700-f5e1-11ea-878c-2e585459dda1.jpg)
<br>

## 背景
前職でワークショップを行うことが多かったが、自身で企画、手配、開催をすると
どうしても時間や人員の兼ね合いが難しくなることが多かった。
名前を売りたいフリーランスの方やお店のスタッフを外部講師として呼び、
ワークショップを行っていただければ、店舗も外部講師もお客様もメリットしかないと考えていた。

現状ワークショップのマッチングアプリがなかった為、作成をした。

<br>

## ER図
<img width="1141" alt="77f5e26f0405a4eb6c8aa401a6dba629" src="https://user-images.githubusercontent.com/67133171/90592632-0130e080-e221-11ea-85d5-fbd33225451f.png">


<br>
# 実装機能紹介
---


<br>

---

### ページネーション機能

・kaminari gemを使用して、ページネーションを実装<br>
・新着順に並び替え、５枚ごとに表示
![2125e191333929699d09107f7367c6b9](https://user-images.githubusercontent.com/67133171/93013220-60e09880-f5e1-11ea-8b5f-63ccc7a98778.jpg)
<br>

### ダイレクトメール機能

・１対１でチャットができる機能<br>
・ログインしないと、チャットができないよう実装 

<br>

### ワークショップ開催、詳細機能

・ワークショップ開催機能<br>
・ワークショップ修正、削除機能<br>
・ログイン時に確認できるよう実装<br>
・自身が開催した場合に限り、編集削除ができるよう実装

<img width="1439" alt="8c5ccd1d579eab95d7097ba8e0241218" src="https://user-images.githubusercontent.com/67133171/93013217-54f4d680-f5e1-11ea-8366-405cc5cdb17b.png">
<br>

### フォロー機能
・acts_as_follower　gemを使用して、フォロー機能の実装<br>
・自身がフォローしている相手を一覧で確認できるよう実装<br>
・自身のフォロワーを一覧で確認できるよう実装<br>
<img width="595" alt="bf20774b9a7760d73350dfa4adc8486f" src="https://user-images.githubusercontent.com/67133171/93013215-4ad2d800-f5e1-11ea-9abc-952077d0b89e.png">
<br>

## ログイン新規登録機能
・devise gemを使用して、新規登録機能の実装<br>
・デフォルトのemail password以外に、name photo profileカラムを追加してマイページを作成
<img width="1127" alt="f85ac69dcb0379e7119721f3c16b5aa1" src="https://user-images.githubusercontent.com/67133171/93013219-5d4d1180-f5e1-11ea-96f1-b8403f4420c5.png">


## 開発状況
---


- 開発環境
    * 開発言語：
        * Ruby/Ruby on Rails
    * 開発ツール：
        * Gthub/Heroku/Visual Studio Code
    * データベース：
        * MySQL
- 開発期間
    * 開発期間：
        * 26日間(8/18 ~ 9/13)
    * 平均作業時間：
        * 5時間/1日
- 動作概要
    * 接続先情報
    * URL：
        * https://workshop-matching-app.herokuapp.com/
    * Email:
        * test@gmail.com
    * Pass:
        * testtest
        
       


# WORKSHOP-APP DB設計

## Userテーブル
使用gem

- devise
- carrierwave
- mini_magick

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|profile|text||
|entry|integer||
|image|string|null: false|

### Association

- has_many :entries
- has_many :messages
- has_many :works
- has_many :stars

## Entryテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|room_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :room

## Roomテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|

### Association

- has_many :entries
- has_many :messages


## Messageテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|room_id|references|null: false, foreign_key: true|
|message|text||

### Association

- belongs_to :user
- belongs_to :room



## Workテーブル

使用gem

- kaminari
- acts_as_follower
- carrierwave
- mini_magick


|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|address|string|null: false|
|url|string||
|photo|string|null: false|

### Association

- has_many :stars
- belongs_to :user


## Starテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|work_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :work
