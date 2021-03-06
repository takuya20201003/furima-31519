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
  end

  with_options presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} do
    validates :price
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :completed_at_id
  end

end