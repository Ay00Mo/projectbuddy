class CasesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @case = Case.new
  end

  def create
    @case = Case.new(case_params)
    if @case.save
      redirect_to root_path, notice: '案件が正常に作成されました。' # マイページ実装後はマイページに戻るように設定する
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def case_params
    params.require(:case).permit(:reference_number, :application_number, :id, :country_code, :law_category_id, :category_id,
                                 :status_id, :beginning_date, :deadline, :absolute_deadline, :request_date, :delivery_date,
                                 :response_date, :instruction_date, :filing_date, :remarks).merge(user_id: current_user.id)
  end
end
