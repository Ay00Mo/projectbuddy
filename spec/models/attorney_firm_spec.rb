require 'rails_helper'

RSpec.describe AttorneyFirm, type: :model do
  before do
    @attorney_firm = FactoryBot.build(:attorney_firm)
  end

  describe '代理人新規登録' do
    context '新規登録できる場合' do
      it 'firm_name_jpとfirm_name_enが存在存在すれば登録できる' do
        expect(@attorney_firm).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'firm_name_jpが空では登録できない' do
        @attorney_firm.firm_name_jp = ''
        @attorney_firm.valid?
        expect(@attorney_firm.errors.full_messages).to include("Firm name jp can't be blank")
      end
      it 'firm_name_jpに半角カナが含まれていると登録できない' do
        @attorney_firm.firm_name_jp = 'ｽﾐｽ'
        @attorney_firm.valid?
        expect(@attorney_firm.errors.full_messages).to include('Firm name jp is invalid. Use only valid characters.')
      end
      it 'firm_name_jpに全角記号が含まれていると登録できない' do
        @attorney_firm.firm_name_jp = 'スミス ＆ ジョン'
        @attorney_firm.valid?
        expect(@attorney_firm.errors.full_messages).to include('Firm name jp is invalid. Use only valid characters.')
      end
      it 'firm_name_enが空では登録できない' do
        @attorney_firm.firm_name_en = ''
        @attorney_firm.valid?
        expect(@attorney_firm.errors.full_messages).to include("Firm name en can't be blank")
      end
      it 'firm_name_enに全角文字が含まれている登録できない' do
        @attorney_firm.firm_name_en = '田中特許事務所'
        @attorney_firm.valid?
        expect(@attorney_firm.errors.full_messages).to include('Firm name en is invalid. Input valid English characters.')
      end
      it 'firm_name_enに全角記号が含まれていると登録できない' do
        @attorney_firm.firm_name_en = 'Smith ＆ John'
        @attorney_firm.valid?
        expect(@attorney_firm.errors.full_messages).to include('Firm name en is invalid. Input valid English characters.')
      end
    end
  end
end
