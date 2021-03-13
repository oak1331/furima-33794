require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '登録ができる時' do

      it '全ての項目の入力がが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上かつ半角英数字混合であれば登録できること' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end

    end

    context '登録ができない時' do

      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
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

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角数字のみのときに登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが半角英語のみのときに登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが全角のときに登録できないこと' do
        @user.password = '１２３４５A'
        @user.password_confirmation = '１２３４５A'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空では登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_nameが半角では登録できないこと' do
        @user.family_name = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Full-width katakana characters')
      end

      it 'first_nameが半角では登録できないこと' do
        @user.first_name = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width katakana characters')
      end

      it 'family_name_kanaが空では登録できないこと' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'family_name_kanaが半角では登録できないこと' do
        @user.family_name_kana = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters')
      end

      it 'first_name_kanaが半角では登録できないこと' do
        @user.first_name_kana = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end

      it 'family_name_kanaがカタカナ以外の全角では登録できないこと' do
        @user.family_name_kana = 'カタカナ全角'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters')
      end

      it 'first_name_kanaがカタカナ以外の全角では登録できないこと' do
        @user.first_name_kana = 'カタカナ全角'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end

  end
end
