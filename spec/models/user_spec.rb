require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)  
  end

  describe 'ユーザー新規登録' do

    context '内容に問題がない場合' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空では登録できない' do
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do  
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'first_nameがからの場合は登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank", "First name is invalid"
      end

      it 'last_nameがからの場合は登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name is invalid"
      end

      it 'first_name_kanaがからの場合は登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank", "First name kana is invalid"
      end

      it 'last_name_kanaがからの場合は登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank", "Last name kana is invalid"
      end

      it 'birthdayがからの場合は登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが一致しないと登録できない' do
      @user.password = 'a12345'
      @user.password = 'b12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下では登録できない' do
      @user.password = 'a1234'
      @user.password_confirmation = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end  

      it 'passwordが半角英字だけでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角数字だけでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.last_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'emailには@が含まれなければ登録できない' do
      @user.email = "abcdocomo.ne.jp"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが全角英数字混合では登録できない' do
      @user.password = 'ＡＡＡ１１１'
      @user.password_confirmation = 'ＡＡＡ１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
end


