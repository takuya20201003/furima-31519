require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address,user_id:user.id, item_id:item.id)
      sleep(1)
    end

    context '登録ができる時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@purchase_shipping_address).to be_valid
      end
      it '建物が空でも購入できること' do
        @purchase_shipping_address.building = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '登録が出来ない時' do
      it '郵便番号が空では購入できないこと' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号はハイフンが必要なこと' do
        @purchase_shipping_address.postal_code = '1111111'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県が空では購入できないこと' do
        @purchase_shipping_address.prefecture_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("都道府県名を選択してください")
      end
      it '市区町が空では購入できないこと' do
        @purchase_shipping_address.municipality = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("市町村名を入力してください")
      end
      it '番地が空では購入できないこと' do
        @purchase_shipping_address.address = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空では購入できないこと' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it "tokenが空では購入できないこと" do
        @purchase_shipping_address.token = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("トークンを入力してください")
      end
      it 'user_idが空だと登録できない' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空だと登録できない' do
        @purchase_shipping_address.item_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Itemを入力してください")
      end
      it '電話番号が英数字混合の時登録できない' do
        @purchase_shipping_address.phone_number = '0901234567a'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が１２桁以上だと登録できない' do
        @purchase_shipping_address.phone_number = '0901234567890'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("電話番号は12文字以内で入力してください")
      end
      it '電話番号は全角では登録できない' do
        @purchase_shipping_address.phone_number = '０９０１２３４５６７８'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end