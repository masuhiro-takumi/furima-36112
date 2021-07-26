# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| first_name_kana    | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| nickname           | string | null: false |
| birthday           | date   | null: false |


### Association
has_many :items
has_one :purchase_history

### items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| text               | text       | null: false |
| category_id        | integer    | null: false |
| state_id           | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| prefecture_id      | integer    | null: false |
| days_to_ship_id    | integer    | null: false |
| place              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### associations
belongs_to :user
belongs_to :purchase_history

###  purchase_histories テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### associations
belongs_to :user
has_many :items
has_one :buyer_information

###  buyer_information テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| prefecture_id      | integer    | null: false |
| municipality       | string     | null: false |
| address            | string     | null: false |
| building_name      | string     | null: false |
| phone_number       | integer    | null: false |

### associations
belongs_to :purchase_history


