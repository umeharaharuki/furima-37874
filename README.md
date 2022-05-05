# README

# テーブル設計

## users テーブル

| Column             | Type     | Options                    |
| ------------------ | -------- | -------------------------- |
| nickname           | string   | null: false                |
| email              | string   | null: false, unique: true  |
| encrypted_password | string   | null: false                |
| first_name         | string   | null: false                |
| last_name          | string   | null: false                |
| first_name_kana    | string   | null: false                |
| last_name_kana     | string   | null: false                |
| birthday           | date     | null: false                |

### Association
- has_many :items
- has_many :purchases


## items テーブル

| Column         | Type         | Options                        |
| -------------- | ------------ | ------------------------------ |
| product_name   | string       | null: false                    |
| explanation    | text         | null: false                    |
| category_id    | integer      | null: false                    |
| situation_id   | integer      | null: false                    |
| charge_id      | integer      | null: false                    |
| prefecture_id  | integer      | null: false                    |
| ship_id        | integer      | null: false                    |
| price          | integer      | null: false                    |
| user           | references   | null: false  foreign_key: true |

### Association
- has_many :purchases
- belongs to :users

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false  foreign_key: true |
| item         | references | null: false, foreign_key: true |

###  Association
- belongs to :users
- belongs to :items


## shipping_addresses テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| postal_code    | integer | null: false                    |
| prefectures_id | integer | null: false                    |
| house_number   | integer | null: false                    |
| building       | text    | null: false                    |
| telephone      | integer | null: false, unique: true      |

### Association
- has_one :purchases