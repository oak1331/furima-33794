require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end

    context '登録ができる時' do
      it '全ての項目の入力がが存在すれば登録できること' do
        expect(@order_address).to be_valid
      end

      it 'postal_codeが半角数字3桁ハイフン半角数字4桁の記述であれば登録できること' do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end

      it 'phoneが半角数字かつ11桁以下であれば登録できること' do
        @order_address.phone = 12345678901
        expect(@order_address).to be_valid
      end
    end

    context '登録ができない時' do
      it 'postal_codeが空では登録できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが無ければ登録できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeが全角では登録できないこと' do
        @order_address.postal_code = '１２３ー４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeが半角英数字混合では登録できないこと' do
        @order_address.postal_code = '123-456a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeが半角英語のみでは登録できないこと' do
        @order_address.postal_code = 'hankaku'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'cityが空では登録できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'streetが空では登録できないこと' do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end

      it 'phoneが空では登録できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが12桁以上では登録できないこと' do
        @order_address.phone = 123456789012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end

      it 'phoneが全角では登録できないこと' do
        @order_address.phone = '１２３４５６７８９０１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end

      it 'phoneが半角英数字混合では登録できないこと' do
        @order_address.phone = '1234567890a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end

      it 'phoneが半角英語のみでは登録できないこと' do
        @order_address.phone = 'hankaku'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end

      it 'prefecture_idが1では登録できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
