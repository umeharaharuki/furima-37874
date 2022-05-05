# README

# テーブル設計

## users テーブル

| Column             | Type     | Options                    |
| ------------------ | -------- | -------------------------- |
| nickname           | string   | null: false                |
| email              | string   | null: false                |
| encrypted_password | string   | null: false                |
| first_name         | string   | null: false                |
| last_name          | string   | null: false                |
|  first_name_kana   | string   | null: false                |
| last_name_kana     | string   | null: false                |
|  birthday          | datetime | null: false                |


## items テーブル

| Column      | Type            | Options                     |
| ----------- | --------------- | --------------------------- |
| product_name   | string       | null: false                 |
| explanation    | text         | null: false                 |
| category_id    | integer      | null: false                 |
| situation_id   | integer      | null: false                 |
| charge_id      | integer      | null: false                 |
| prefectures_id | integer      | null: false                 |
| days_id        | integer      | null: false                 |
| price          | integer      | null: false                 |

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
|       | text       | null: false                    |
|    | references | null: false, foreign_key: true |
|    | references | null: false, foreign_key: true |


## shipping_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code      | text       | null: false                    |
| prefectures_id    | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |