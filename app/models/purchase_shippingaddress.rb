class PurchaseShippingAddress
  include ActiveModel::Model
  atter_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :purchase

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number, numericality: { less_than_or_equal_to: 11 }
    validates :user_id
    validates :item_id
  end

  def save
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, user_id: user_id, item_id: item_id)
    purchase.create(user_id: user_id, item_id: item_id)
  end
end