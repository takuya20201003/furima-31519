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
- has_many :purchases

## items テーブル

| Column                          | Type       | Option                         | 
| ------------------------------- | ---------- | ------------------------------ |
| name                            | string     | null: false                    |
| description                     | text       | null: false                    |
| category_id                     | integer    | null: false                    |
| condition_id                    | integer    | null: false                    |
| shipping_charge_id              | integer    | null: false                    |
| prefecture_id                   | integer    | null: false                    |
| completed_at_id                 | integer    | null: false                    |
| price                           | integer    | null: false                    |
| user                            | references | null: false, foreign_key: true |

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
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## purchases

| Column             | Type       | Option                         |
| ------------------ | -----------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :shipping_address
- belongs_to :item
