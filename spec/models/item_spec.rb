require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての項目の入力がが存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'category_idが1では登録できないこと' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'condition_idが1では登録できないこと' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it 'delivery_idが1では登録できないこと' do
      @item.delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery must be other than 1")
    end

    it 'prefecture_idが1では登録できないこと' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'shipping_date_idが1では登録できないこと' do
      @item.shipping_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
