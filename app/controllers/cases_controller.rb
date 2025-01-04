class CasesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_form_data, only: [:new, :create]

  def index
  end

  def new
    @case = Case.new
  end

  def create
    @case = Case.new(case_params)
    if @case.save
      redirect_to user_path(current_user), notice: '案件が正常に作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @case = Case.find(params[:id])
    @applicants = @case.applicants
    @attorney_firms = @case.attorney_firms
    @contacts = @case.contacts
    @procedures = @case.procedures
  end

  private

  def set_form_data
    @users = User.all
    @contacts = Contact.all
    @attorney_firms = AttorneyFirm.all
    @applicants = Applicant.all
    @procedures = Procedure.all
  end

  def case_params
    params.require(:case).permit(:reference_number, :application_number, :id, :country_code, :law_category_id, :category_id,
                                 :status_id, :beginning_date, :deadline, :absolute_deadline, :request_date, :delivery_date,
                                 :response_date, :instruction_date, :filing_date, :remarks, :internal_contact_id, :contact_ids, :attorney_firm_ids, :applicant_ids, :procedure_ids).merge(user_id: current_user.id) # rubocop:disable Layout/LineLength
  end
end
