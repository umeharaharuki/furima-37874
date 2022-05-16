require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報登録' do
    context '登録できる場合' do
      it 'product_nameとexplanationとcategory_idとsituation_idとcharge_idとprefecture_idとship_idとpriceとimageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '空では登録できない場合' do
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
      end
      it 'situation_idが空では登録できない' do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力してください')
      end
      it 'charge_idが空では登録できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
      end
      it 'ship_idが空では登録できない' do
        @item.ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end

      context '1では登録できない場合' do
        it 'category_idが1では登録できない' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include('カテゴリーが空です')
        end
        it 'situation_idが1では登録できない' do
          @item.situation_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include('商品の状態が空です')
        end
        it 'charge_idが1では登録できない' do
          @item.charge_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include('配送料の負担が空です')
        end
        it 'prefecture_idが1では登録できない' do
          @item.prefecture_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include('発送元の地域が空です')
        end
        it 'ship_idが1では登録できない' do
          @item.ship_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include('発送までの日数が空です')
        end
      end
      context 'priceが登録できない場合' do
        it 'priceが半角数値以外では登録できない' do
          @item.price = '３５０'
          @item.valid?
          expect(@item.errors.full_messages).to include('価格を300~9999999の間で半角数値で入力してください')
        end
        it 'priceが300円未満では登録できない' do
          @item.price = '200'
          @item.valid?
          expect(@item.errors.full_messages).to include('価格を300~9999999の間で半角数値で入力してください')
        end
        it 'priceが9999999円以上では登録できない' do
          @item.price = '99999999'
          @item.valid?
          expect(@item.errors.full_messages).to include('価格を300~9999999の間で半角数値で入力してください')
        end
      end

      context 'userが紐付いていないと登録できない場合' do
        it 'userが紐付いていないと保存できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Userを入力してください')
        end
      end
    end
  end
end
