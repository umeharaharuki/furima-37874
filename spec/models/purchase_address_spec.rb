require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが3桁-4桁でないと保存できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1以外でないと保存できないこと' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @purchase_address.telephone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが10桁以下だと保存できないこと' do
        @purchase_address.telephone = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが11桁以上だと保存できないこと' do
        @purchase_address.telephone = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが半角数値以外だと保存できないこと' do
        @purchase_address.telephone = '080-123-456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
   end
  end
end
