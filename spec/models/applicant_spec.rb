require 'rails_helper'

RSpec.describe Applicant, type: :model do
  before do
    @applicant = FactoryBot.build(:applicant)
  end

  describe '出願人新規登録' do
    context '新規登録できる場合' do
      it 'applicant_name_jpとapplicant_name_enが存在すれば登録できる' do
        expect(@applicant).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'applicant_name_jpが空だと登録できない' do
        @applicant.applicant_name_jp = ''
        @applicant.valid?
        expect(@applicant.errors.full_messages).to include("Applicant name jp can't be blank")
      end
      it 'applicant_name_jpが半角カナだと登録できない' do
        @applicant.applicant_name_jp = 'ｽﾐｽ'
        @applicant.valid?
        expect(@applicant.errors.full_messages).to include("Applicant name jp is invalid. Input full-width characters.") # rubocop:disable Style/StringLiterals
      end
      it 'applicant_name_jpが半角英字だと登録できない' do
        @applicant.applicant_name_jp = 'Smith'
        @applicant.valid?
        expect(@applicant.errors.full_messages).to include("Applicant name jp is invalid. Input full-width characters.") # rubocop:disable Style/StringLiterals
      end
      it 'applicant_name_enが空だと登録できない' do
        @applicant.applicant_name_en = ''
        @applicant.valid?
        expect(@applicant.errors.full_messages).to include("Applicant name en can't be blank")
      end
      it 'applicant_name_enが全角文字だと登録できない' do
        @applicant.applicant_name_en = '田中'
        @applicant.valid?
        expect(@applicant.errors.full_messages).to include("Applicant name en is invalid. Input valid English characters.") # rubocop:disable Style/StringLiterals
      end
      it 'applicant_name_enが全角英字だと登録できない' do
        @applicant.applicant_name_en = 'Ｔａｎａｋａ'
        @applicant.valid?
        expect(@applicant.errors.full_messages).to include("Applicant name en is invalid. Input valid English characters.") # rubocop:disable Style/StringLiterals
      end
    end
  end
end
