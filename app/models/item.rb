class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :completed_at
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_charge

  with_options presence: true do
    validates :name
    validates :description
    validates :image

    with_options numericality: { only_integer: true, format: { with: /\A[0-9]+\z/ }, greater_than_or_equal_to: 300,
                                 less_than_or_equal_to: 9_999_999 } do
      validates :price
    end

    with_options numericality: { other_than: 1 ,message: 'を選択してください' } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :completed_at_id
    end
  end
end
