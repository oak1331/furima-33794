# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday_yy      | integer | null: false |
| birthday_mm      | integer | null: false |
| birthday_dd      | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | ActiveStorage, null: false     |
| name          | text       | null: false                    |
| comment       | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery      | string     | null: false                    |
| prefecture    | string     | null: false                    |
| shipping_date | string     | null: false                    |
| price         | integer    | null: false                    |
| seller        | references | null: false, foreign_key: true |
| buyer         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :purchases
- belongs_to :address

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## address テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| street      | string     | null: false                    |
| building    | string     | null: false                    |
| phone       | integer    | null: false                    |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :items