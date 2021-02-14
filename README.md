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

| Column                          | Type       | Option                         | 
| ------------------------------- | ---------- | ------------------------------ |
| name                            | string     | null: false, foreign_key: true |
| description                     | text       | null: false, foreign_key: true |
| category_id                     | integer    | null: false, foreign_key: true |
| condition_id                    | integer    | null: false, foreign_key: true |
| shipping_charges_id             | integer    | null: false, foreign_key: true |
| prefecture_id                   | integer    | null: false, foreign_key: true |
| completed_at_id                 | integer    | null: false, foreign_key: true |
| price                           | integer    | null: false, foreign_key: true |
| user_id                         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## shipping addresses

| Column         | Type       | Option                         |
|--------------- |----------- | -------------------------------|
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_num      | string     | null: false                    |
| purchasers_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchaser

## purchasers

| Column             | Type   | Option                         |
| ------------------ | -------|--------------------------------|
| user_id            | string | null: false, foreign_key: true |
| item_id            | string | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :shipping address
- has_many :items
