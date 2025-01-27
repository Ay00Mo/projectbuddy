class CasesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_form_data, only: [:new, :create, :search_form, :search_results, :edit, :update]
  before_action :set_case, only: [:show, :edit, :update, :check_pin]

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

  def update
    @case = Case.find(params[:id])
    if @case.update(case_params)
      redirect_to case_path(@case), notice: '案件が正常に作成されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def search_form
    # 検索フォームページ用
    @q = Case.ransack(params[:q])
    @applicants = Applicant.all
    @attorney_firms = AttorneyFirm.all
  end

  def search_results
    @q = Case.ransack(params[:q])

    # 範囲検索の場合
    if params[:q] # rubocop:disable Style/ConditionalAssignment
      @cases = @q.result(distinct: true)
    else
      @cases = []
    end
  end

  def check_pin
    # ユーザー種別がadmin(1)またはinternal_contactが一致する場合
    if current_user.user_type == 1 || @case.internal_contact == current_user
      # PIN番号が一致する場合
      if params[:pin_number].to_i == current_user.pin_number
        case params[:commit]
        when 'レコード修正'
          redirect_to edit_case_path(@case), notice: '修正画面に遷移しました。'
        when 'レコード削除'
          @case.destroy
          redirect_to cases_path, notice: '案件を削除しました。'
        else
          redirect_to case_path(@case), alert: '無効な操作です。'
        end
      else
        redirect_to case_path(@case), alert: 'PINが一致しません。'
      end
    else
      redirect_to case_path(@case), alert: '権限がありません。'
    end
  end

  private

  def set_form_data
    @users = User.all
    @contacts = Contact.all
    @attorney_firms = AttorneyFirm.all
    @applicants = Applicant.all
    @procedures = Procedure.all
  end

  def set_case
    @case = Case.find(params[:id])
  end

  def case_params
    params.require(:case).permit(:reference_number, :application_number, :id, :country_code, :law_category_id, :category_id,
                                 :status_id, :beginning_date, :deadline, :absolute_deadline, :request_date, :delivery_date,
                                 :response_date, :instruction_date, :filing_date, :remarks, :internal_contact_id, :contact_ids, :attorney_firm_ids, :applicant_ids, :procedure_ids).merge(user_id: current_user.id) # rubocop:disable Layout/LineLength
  end
end
