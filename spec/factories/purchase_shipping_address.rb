FactoryBot.define do
  factory :purchase_shipping_address do
      postal_code { '123-4567' }
      prefecture_id { 2 }
      municipality { ' 福岡市博多区 ' }
      address { '１−１' }
      building { 'ハイツ' }
      phone_number { '09012345678' }
      token {"tok_abcdefghijk00000000000000000"}

  end
end
