require 'rails_helper'

RSpec.describe PurchaseHistoryPurchaser, type: :model do
  describe '#create' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_history_purchaser = FactoryBot.build(:purchase_history_purchaser, user_id: user.id, item_id: item.id)
      sleep 0.1
    end


    context '内容に問題がない場合' do
      it "全ての項目が入力されていれば登録できる" do
      expect(@purchase_history_purchaser).to be_valid
      end

      it 'buinding_nameがからでも登録できる' do
        @purchase_history_purchaser.building_name = ''
        expect(@purchase_history_purchaser).to be_valid
       end
    end

    context '内容に問題がある場合' do
      it 'postal_codeがからだと登録できない' do
        @purchase_history_purchaser.postal_code = nil
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeが数字でないと登録できない' do
        @purchase_history_purchaser.postal_code = 'あああ-ああ'
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeはハイフンがないと登録できない' do
        @purchase_history_purchaser.postal_code = '1111111'
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeは半角数字3文字-4文字でないと登録できない' do
        @purchase_history_purchaser.postal_code = '1111-111'
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeは全角数字だと登録できない' do
        @purchase_history_purchaser.postal_code = '１１１-１１１１'
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idがからだと登録できない' do
        @purchase_history_purchaser.prefecture_id = 1
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityがからだと登録できない' do
       @purchase_history_purchaser.municipality = ''
       @purchase_history_purchaser.valid?
       expect(@purchase_history_purchaser.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressがからだと登録できない' do
        @purchase_history_purchaser.address = ''
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Address can't be blank")
       end

       it 'phone_numberがからだと登録できない' do
        @purchase_history_purchaser.phone_number = ''
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Phone number can't be blank")
       end

       it 'phone_numberは10-11文字の半角数字の羅列でしか登録できない' do
        @purchase_history_purchaser.phone_number = '080-1111-1111'
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Phone number is invalid")
       end

       it 'phone_numberは10-11文字の全角数字の羅列では登録できない' do
        @purchase_history_purchaser.phone_number = '０８０１１１１１１１１'
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Phone number is invalid")
       end

       it 'phone_numberは9文字以下の数字の羅列では登録できない' do
        @purchase_history_purchaser.phone_number = '080111111'
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Phone number is invalid")
       end

       it 'phone_numberは12文字以上の数字の羅列では登録できない' do
        @purchase_history_purchaser.phone_number = '080111111111'
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Phone number is invalid")
       end

       it 'phone_numberは英数混合では登録できない' do
        @purchase_history_purchaser.phone_number = 'aaa00001111'
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Phone number is invalid")
       end

       it "tokenが空では登録できないこと" do
        @purchase_history_purchaser.token = nil
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Token can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @purchase_history_purchaser.user_id = nil
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("User can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @purchase_history_purchaser.item_id = nil
        @purchase_history_purchaser.valid?
        expect(@purchase_history_purchaser.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
