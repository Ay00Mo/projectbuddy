require 'rails_helper'

RSpec.describe Case, type: :model do
  before do
    @case = FactoryBot.build(:case)
  end

  describe '案件登録' do
    context '案件登録できる場合' do
      it '全ての値が存在すれば登録できる' do
        expect(@case).to be_valid
      end
      it '任意の項目の値が空でも(request_date, delivery_date, response_date, instruction_date, filing_date, remarks)登録できる' do
        @case.request_date = ''
        @case.delivery_date = ''
        @case.response_date = ''
        @case.instruction_date = ''
        @case.filing_date = ''
        expect(@case).to be_valid
      end
    end
    context '案件登録できない場合' do
      it 'reference_numberが空では登録できない' do
        @case.reference_number = ''
        @case.valid?
        expect(@case.errors.full_messages).to include("Reference number can't be blank")
      end
      it 'reference_numberに全角英字が含まれていると登録できない' do
        @case.reference_number = 'Ｆ2024-aaa-001'
        @case.valid?
        expect(@case.errors.full_messages).to include('Reference number is invalid. Only alphanumeric characters and allowed symbols (!#$%&’, -/) are permitted') # rubocop:disable Layout/LineLength
      end
      it 'reference_numberに全角数字が含まれていると登録できない' do
        @case.reference_number = 'NM２０２４#101'
        @case.valid?
        expect(@case.errors.full_messages).to include('Reference number is invalid. Only alphanumeric characters and allowed symbols (!#$%&’, -/) are permitted') # rubocop:disable Layout/LineLength
      end
      it 'reference_numberに許可していない記号(!#$%&,-.)以外が含まれていると登録できない' do
        @case.reference_number = 'BBB@AAA'
        @case.valid?
        expect(@case.errors.full_messages).to include('Reference number is invalid. Only alphanumeric characters and allowed symbols (!#$%&’, -/) are permitted') # rubocop:disable Layout/LineLength
      end
      it 'application_numberが空では登録できない' do
        @case.application_number = ''
        @case.valid?
        expect(@case.errors.full_messages).to include("Application number can't be blank")
      end
      it 'application_numberに全角英字が含まれていると登録できない' do
        @case.application_number = 'ＡＢＣ'
        @case.valid?
        expect(@case.errors.full_messages).to include('Application number is invalid. Only alphanumeric characters and allowed symbols (!#$%&’, -/) are permitted') # rubocop:disable Layout/LineLength
      end
      it 'application_numberに全角数字が含まれていると登録できない' do
        @case.application_number = '１２３４５６'
        @case.valid?
        expect(@case.errors.full_messages).to include('Application number is invalid. Only alphanumeric characters and allowed symbols (!#$%&’, -/) are permitted') # rubocop:disable Layout/LineLength
      end
      it 'application_numberに許可していない記号(!#$%&,-.)以外が含まれていると登録できない' do
        @case.application_number = 'qt1345^90'
        @case.valid?
        expect(@case.errors.full_messages).to include('Application number is invalid. Only alphanumeric characters and allowed symbols (!#$%&’, -/) are permitted') # rubocop:disable Layout/LineLength
      end
      it 'country_codeが空だと登録できない' do
        @case.country_code = ''
        @case.valid?
        expect(@case.errors.full_messages).to include("Country code can't be blank")
      end
      it 'country_codeが3桁以上だと登録できない' do
        @case.country_code = 'USA'
        @case.valid?
        expect(@case.errors.full_messages).to include('Country code should be 2 capital letters')
      end
      it 'country_codeが小文字だと登録できない' do
        @case.country_code = 'jp'
        @case.valid?
        expect(@case.errors.full_messages).to include('Country code should be 2 capital letters')
      end
      it 'beginnin_dateが空だと登録できない' do
        @case.beginning_date = ''
        @case.valid?
        expect(@case.errors.full_messages).to include("Beginning date can't be blank")
      end
      it 'deadlineが空だと登録できない' do
        @case.deadline = ''
        @case.valid?
        expect(@case.errors.full_messages).to include("Deadline can't be blank")
      end
      it 'deadlineがabsolute_deadline以降の日付だと登録できない' do
        @case.deadline = '2024/11/01'
        @case.absolute_deadline = '2024/10/31'
        @case.valid?
        expect(@case.errors.full_messages).to include('Deadline should be on or before the absolute deadline')
      end
      it 'absolute_deadlineが空だと登録できない' do
        @case.absolute_deadline = ''
        @case.valid?
        expect(@case.errors.full_messages).to include("Absolute deadline can't be blank")
      end
      it 'law_category_idが空だと登録できない' do
        @case.law_category_id = '1'
        @case.valid?
        expect(@case.errors.full_messages).to include("Law category can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @case.category_id = ''
        @case.valid?
        expect(@case.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空だと登録できない' do
        @case.status_id = ''
        @case.valid?
        expect(@case.errors.full_messages).to include("Status can't be blank")
      end
      it 'userが存在しない場合登録できない' do
        @case.user = nil
        @case.valid?
        expect(@case.errors.full_messages).to include('User must exist')
      end
    end
  end
end
