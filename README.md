## users テーブル

| Column           | Type   | Option      |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | string | null: false |

### Association

- has_many :items
- has_many :Purchases

## items テーブル

| Column                            | Type      | Option      | 
| ----------------------------------| ----------| ----------- |
| image                             | reference | null: false |
| name                              | string    | null: false |
| description                       | string    | null: false |
| category                          | reference | null: false |
| condition                         | reference | null: false |
| who_will_pay_the_shipping_charges | reference | null: false |
| prefecture                        | reference | null: false |
| completed_at                      | reference | null: false |
| price                             | integer   | null: false |

### Association

- belongs to users
- belongs to purchases

## purchases

| column                      |Type      | Option      |
|---------------------------- |--------- | ------------|
| credit_card_number          | integer  | null: false |
| credit_card_expiration_date | integer  | null: false |
| card_security_code          | integer  | null: false |
| postal_code                 | integer  | null: false |
| prefecture                  | string   | null: false |
| municipality                | string   | null: false |
| address                     | string   | null: false |
| building                    | string   |             |
| phone_number                | string   | null: false |

### Association

- belongs to users
- belongs to items