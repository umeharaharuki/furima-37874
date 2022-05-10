require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報登録' do
    context '登録できる場合' do
      it "product_nameとexplanationとcategory_idとsituation_idとcharge_idとprefecture_idとship_idとpriceとimageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '空では登録できない場合' do
      it "product_nameが空では登録できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "explanationが空では登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "situation_idが空では登録できない" do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it "charge_idが空では登録できない" do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "ship_idが空では登録できない" do
        @item.ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      context '1では登録できない場合' do
      it "category_idが1では登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "situation_idが1では登録できない" do
        @item.situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it "charge_idが1では登録できない" do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it "prefecture_idが1では登録できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "ship_idが1では登録できない" do
        @item.ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship can't be blank")
      end
    end
    context 'priceが登録できない場合' do
      it "priceが半角数値以外では登録できない" do
        @item.price = '３５０'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "priceが300~9999999以外では登録できない" do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end

    context 'userが紐付いていないと登録できない場合' do
    it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
end
end
