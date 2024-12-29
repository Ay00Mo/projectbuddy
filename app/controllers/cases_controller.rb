class CasesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    @case = Case.new
    @users = User.all
    @contacts = Contact.all
    @attorney_firms = AttorneyFirm.all
  end

  def create
    @case = Case.new(case_params)
    @users = User.all
    @contacts = Contact.all
    @attorney_firms = AttorneyFirm.all
    if @case.save
      redirect_to user_path(current_user), notice: '案件が正常に作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @case = Case.find(params[:id])
  end

  private

  def case_params
    params.require(:case).permit(:reference_number, :application_number, :id, :country_code, :law_category_id, :category_id,
                                 :status_id, :beginning_date, :deadline, :absolute_deadline, :request_date, :delivery_date,
                                 :response_date, :instruction_date, :filing_date, :remarks, :internal_contact_id, :contact_ids, :attorney_firm_ids).merge(user_id: current_user.id) # rubocop:disable Layout/LineLength
  end
end
