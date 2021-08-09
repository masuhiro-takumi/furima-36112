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
has_many :purchase_histories

### items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| content            | text       | null: false |
| category_id        | integer    | null: false |
| sales_state_id     | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| prefecture_id      | integer    | null: false |
| day_to_ship_id     | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### associations
belongs_to :user
has_one :purchase_history

###  purchase_histories テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### associations
belongs_to :user
belongs_to :item
has_one :purchaser

###  purchasers テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| prefecture_id      | integer    | null: false |
| postal_code        | string     | null: false |
| municipality       | string     | null: false |
| address            | string     | null: false |
| building_name      | string     |
| phone_number       | string     | null: false |
| purchase_history   | references | null: false, foreign_key: true |

### associations
belongs_to :purchase_history


