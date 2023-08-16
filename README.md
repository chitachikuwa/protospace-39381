#テーブル設計

## users テーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nama               | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

### Association

- has_many :prototypes
- has_many :comments

## prototypesテーブル

| Colum      | Type       | Option                        |
| ---------- | ---------- | ----------------------------- |
| title      | string     | null: false                   |
| catch_copy | text       | null: false                   |
| concept    | text       | null: false                   |
| user       | references | null: false, foreign_key: true|

### Association

- belongs_to :users
- belongs_to :comments


## commentsテーブル

| Colum      | Type       | Option                        |
| ---------- | ---------- | ----------------------------- |
| content    | text       | null: false                   |
| prototypes | references | null: false, foreign_key:true |
| user       | references | null: false, foreign_key:true |


### Association

- belongs_to :users
- belongs_to :prototypes