class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  def new
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save # rubocop:disable Layout/IndentationConsistency,Lint/RedundantCopDisableDirective
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:applicant_name_jp, :applicant_name_en)
  end
end
