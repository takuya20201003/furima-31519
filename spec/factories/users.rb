FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'test12' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '花子' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'ハナコ' }
    birth_day             { '2021-01-01' }
  end
end
