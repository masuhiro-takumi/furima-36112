# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| nickname           | string | null: false |
| birthday           | date   | null: false |


### Association
has_many :items
has_many :buys

### items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product_name       | string     | null: false |
| product_image      | string     | null: false |
| product_text       | text       | null: false |
| product_category   | string     | null: false |
| product_state      | string     | null: false |
| delivery charge    | integer    | null: false |
| prefectures        | string     | null: false |
| days_to_ship       | integer    | null: false |
| place              | string     | null: false |
| user_id            | references | null: false, foreign_key: true |

### associations
belongs_to :user
has_one :buy


### buy テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| credit_card        | integer    | null: false |
| deadline           | date       | null: false |
| security           | string     | null: false |
| buy_prefecture     | string     | null: false |
| municipality       | string     | null: false |
| address            | string     | null: false |
| building_name      | string     | null: false |
| phone_number       | integer    | null: false |
| item_id            | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |

### associations
belongs_to :user
belongs_to :item

