require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
    end

    it '商品画像を１枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
     @item.category_id = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態についての情報が必須であること' do
    @item.condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.shipping_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.completed_at_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Completed at can't be blank")
    end

    it '価格は¥300~¥9,999,999の間で半角での入力が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
  end
end