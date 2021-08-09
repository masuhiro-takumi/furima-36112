require 'rails_helper'

  RSpec.describe Item, type: :model do
    describe '#create' do
      before do
      @item = FactoryBot.build(:item)
      end

      context '内容に問題がない場合' do
        it "全ての項目が入力されていれば登録できる" do
        expect(@item).to be_valid
        end
      end

      context '内容に問題がある場合' do
        it 'nameがからだと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'contentがからだと登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
        end

        it 'categoryがからだと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'sales_state_idがからだと登録できない' do
          @item.sales_state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Sales state can't be blank")
          end

        it 'delivery_charge_idがからだと登録できない' do
          @item.delivery_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
        end

        it 'prefecture_idがからだと登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'day_to_ship_idがからだと登録できない' do
          @item.day_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Day to ship can't be blank")
        end

        it 'priceがからだと登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが数字じゃないと登録できない' do
          @item.price = 'aaaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが半角数字じゃないと登録できない' do
          @item.price = '３３３３３'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが300より小さい数字だと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it 'priceが9,999,999以上だと登録できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end

        it 'priceは半角英数字混合では登録できない' do
        @item.price = '10abc00'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'imageがからだと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'userがからだと登録できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end
  end