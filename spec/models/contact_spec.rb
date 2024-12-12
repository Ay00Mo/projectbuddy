require 'rails_helper'

RSpec.describe Contact, type: :model do
  before do
    @contact = FactoryBot.build(:contact)
  end

  describe '担当者新規登録' do
    context '新規登録できる場合' do
      it 'last_name_jp, first_name_jp, last_name_en, first_name_en が存在すれば登録できる' do
        expect(@contact).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'last_name_jpが空では登録できない' do
        @contact.last_name_jp = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Last name jp can't be blank")
      end
      it 'last_name_jpが半角カナだと登録できない' do
        @contact.last_name_jp = 'ｽﾐｽ'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Last name jp is invalid. Input full-width characters.") # rubocop:disable Style/StringLiterals
      end
      it 'last_name_jpが半角英字だと登録できない' do
        @contact.last_name_jp = 'Smith'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Last name jp is invalid. Input full-width characters.") # rubocop:disable Style/StringLiterals
      end
      it 'first_name_jpが空では登録できない' do
        @contact.first_name_jp = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("First name jp can't be blank")
      end
      it 'first_name_jpが半角カナだと登録できない' do
        @contact.first_name_jp = 'ｼﾞｮﾝ'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("First name jp is invalid. Input full-width characters.") # rubocop:disable Style/StringLiterals
      end
      it 'first_name_jpが半角英字だと登録できない' do
        @contact.first_name_jp = 'John'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("First name jp is invalid. Input full-width characters.") # rubocop:disable Style/StringLiterals
      end
      it 'last_name_enが空では登録できない' do
        @contact.last_name_en = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Last name en can't be blank")
      end
      it 'last_name_enが全角文字だと登録できない' do
        @contact.last_name_en = '田中'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Last name en is invalid. Input valid English characters.") # rubocop:disable Style/StringLiterals
      end
      it 'last_name_enが全角英字だと登録できない' do
        @contact.last_name_en = 'Ｔａｎａｋａ'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Last name en is invalid. Input valid English characters.") # rubocop:disable Style/StringLiterals
      end
      it 'last_name_enの最初の文字が小文字だと登録できない' do
        @contact.last_name_en = 'tanaka'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Last name en is invalid. Input valid English characters.") # rubocop:disable Style/StringLiterals
      end
      it 'first_name_enが空では登録できない' do
        @contact.first_name_en = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("First name en can't be blank")
      end
      it 'first_name_enが全角文字だと登録できない' do
        @contact.first_name_en = '太郎'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("First name en is invalid. Input valid English characters.") # rubocop:disable Style/StringLiterals
      end
      it 'last_name_enが全角英字だと登録できない' do
        @contact.first_name_en = 'Ｔａｒｏ'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("First name en is invalid. Input valid English characters.") # rubocop:disable Style/StringLiterals
      end
      it 'first_name_enの最初の文字が小文字だと登録できない' do
        @contact.first_name_en = 'taro'
        @contact.valid?
        expect(@contact.errors.full_messages).to include("First name en is invalid. Input valid English characters.") # rubocop:disable Style/StringLiterals
      end
    end
  end
end
