require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、＠を含む必要があること' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is invalid')
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが英語のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが全角では登録できないこと' do
      @user.password = 'ａａａａａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @user.password = 'test12'
      @user.password_confirmation = 'test13'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名は苗字が必須であること' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'ユーザー本名は名前が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
    end
    it 'ユーザーの苗字は全角での入力が必須であること' do
      @user.family_name = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it 'ユーザーの名前は全角での入力が必須であること' do
      @user.first_name = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'ユーザー本名は苗字のフリガナが必須であること' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'ユーザー名前のフリガナが必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'ユーザーの苗字の全角カタカナでの入力が必須であること' do
      @user.family_name_kana = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
    it 'ユーザーの名前の全角カタカナでの入力が必須であること' do
      @user.first_name_kana = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '生年月日が必須であること' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
