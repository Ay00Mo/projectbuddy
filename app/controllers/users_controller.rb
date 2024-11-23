class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show]

  def show
    @cases = Case.order(:absolute_deadline, :deadline, :reference_number)
    @unprocessed_cases = Case.where(instruction_date: nil, internal_contact: @user).order(:absolute_deadline, :deadline,
                                                                                          :reference_number)
    @waiting_report_cases = Case.where.not(instruction_date: nil).where(filing_date: nil).where(internal_contact: @user).order(
      :absolute_deadline, :reference_number
    )
  end

  private

  def set_user
    @user = current_user
  end
end
