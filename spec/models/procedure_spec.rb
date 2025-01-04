require 'rails_helper'

RSpec.describe Procedure, type: :model do
  before do
    @procedure = FactoryBot.build(:procedure)
  end

  describe '内容新規登録' do
    context '新規登録できる場合' do
      it 'procedure_nameが存在すれば登録できる' do
        expect(@procedure).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'procedure_nameが空では登録できない' do
        @procedure.procedure_name = ''
        @procedure.valid?
        expect(@procedure.errors.full_messages).to include("Procedure name can't be blank")
      end
      it 'procedure_nameが半角カタカナを含むと登録できない' do
        @procedure.procedure_name = 'ﾄｳﾛｸｻﾃｲ'
        @procedure.valid?
        expect(@procedure.errors.full_messages).to include('Procedure name is invalid. Only full-width Japanese characters, alphabets, numbers, and hyphens are allowed.') # rubocop:disable Layout/LineLength
      end
      it 'procedure_nameが全角英字を含むと登録できない' do
        @procedure.procedure_name = 'ＩＤＳ'
        @procedure.valid?
        expect(@procedure.errors.full_messages).to include('Procedure name is invalid. Only full-width Japanese characters, alphabets, numbers, and hyphens are allowed.') # rubocop:disable Layout/LineLength
      end
      it '重複したprocedure_nameが存在する場合は登録できない' do
        @procedure.save
        another_procedure = FactoryBot.build(:procedure, procedure_name: @procedure.procedure_name)
        another_procedure.valid?
        expect(another_procedure.errors.full_messages).to include('Procedure name already exists. Please choose another name.')
      end
    end
  end
end
