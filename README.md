## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_one :purchasers

## items テーブル

| Column                               | Type      | Option                         | 
| ------------------------------------ | ----------| ------------------------------ |
| name                                 | string    | null: false, foreign_key: true |
| description                          | text      | null: false, foreign_key: true |
| category_id                          | integer   | null: false, foreign_key: true |
| condition_id                         | integer   | null: false, foreign_key: true |
| who_will_pay_the_shipping_charges_id | integer   | null: false, foreign_key: true |
| prefecture_id                        | integer   | null: false, foreign_key: true |
| completed_at_id                      | integer   | null: false, foreign_key: true |
| price                                | integer   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase

## shipping addresses

| Column                      | Type     | Option                         |
|---------------------------- |--------- | -------------------------------|
| postal_code                 | string   | null: false, foreign_key: true |
| prefecture                  | string   | null: false, foreign_key: true |
| municipality                | string   | null: false, foreign_key: true |
| address                     | string   | null: false, foreign_key: true |
| building                    | string   |                                |
| phone_number                | string   | null: false, foreign_key: true |

### Association

- belongs_to :purchaser

## purchasers

| Column             | Type   | Option                    |
| ------------------ | -------|---------------------------|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- belongs_to :user
- has_one :shipping address
