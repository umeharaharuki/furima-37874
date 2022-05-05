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
| user           | references   | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs to :user

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

###  Association
- has_one :shipping_address
- belongs to :user
- belongs to :item


## shipping_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| house_number   | string     | null: false                    |
| building       | string     |                                |
| telephone      | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
- belongs to :purchase