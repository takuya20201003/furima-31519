require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address,user_id:user.id, item_id:item.id)
      sleep(1)
    end

    it '全ての値が正しく入力されていれば購入できること' do
      expect(@purchase_shipping_address).to be_valid
    end
    it '郵便番号が空では購入できないこと' do
      @purchase_shipping_address.postal_code = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号はハイフンが必要なこと' do
      @purchase_shipping_address.postal_code = '1111111'
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid")
    end
    it '都道府県が空では購入できないこと' do
      @purchase_shipping_address.prefecture_id = 0
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it '市区町が空では購入できないこと' do
      @purchase_shipping_address.municipality = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空では購入できないこと' do
      @purchase_shipping_address.address = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空では購入できないこと' do
      @purchase_shipping_address.phone_number = ''
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "tokenが空では購入できないこと" do
      @purchase_shipping_address.token = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end