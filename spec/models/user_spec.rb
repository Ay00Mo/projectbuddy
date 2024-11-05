require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'last_name, first_name, email, password, pin_number, user_typeの情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在している場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まない場合は登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが半角カナだと登録できない' do
        @user.last_name = 'ｽﾐｽ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'last_nameが半角英字だと登録できない' do
        @user.last_name = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'last_nameが全角英字だと登録できない' do
        @user.last_name = 'Ｓｍｉｔｈ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角カナだと登録できない' do
        @user.first_name = 'ｼﾞｮﾝ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'first_nameが半角英字だと登録できない' do
        @user.first_name = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'first_nameが全角英字だと登録できない' do
        @user.first_name = 'Ｊｏｈｎ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5桁以下だと登録できない' do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password cannot be only numbers')
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password cannot be only letters')
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'pin_numberが空だと登録できない' do
        @user.pin_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Pin number can't be blank")
      end
      it 'pin_numberが5桁以上だと登録できない' do
        @user.pin_number = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Pin number is invalid. Input 4 digit numbers.')
      end
      it 'pin_numberが4桁未満だと登録できない' do
        @user.pin_number = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Pin number is invalid. Input 4 digit numbers.')
      end
      it 'pin_numberに英字が含まれると登録できない' do
        @user.pin_number = '123a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Pin number is invalid. Input 4 digit numbers.')
      end
      it 'user_typeが空だと登録できない' do
        @user.user_type = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User type can't be blank")
      end
      it 'user_typeが2桁以上だと登録できない' do
        @user.user_type = '12'
        @user.valid?
        expect(@user.errors.full_messages).to include('User type is invalid. Input 1 or 2.')
      end
      it 'user_typeが1か2以外だと登録できない' do
        @user.user_type = '3'
        @user.valid?
        expect(@user.errors.full_messages).to include('User type is invalid. Input 1 or 2.')
      end
      it 'user_typeに英字が含まれると登録できない' do
        @user.user_type = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('User type is invalid. Input 1 or 2.')
      end
    end
  end
end
