class AttorneyFirmsController < ApplicationController
  def new
    @attorney_firm = AttorneyFirm.new
  end

  def create
    @attorney_firm = AttorneyFirm.new(attorney_firm_params)
    if @attorney_firm.save # rubocop:disable Layout/IndentationConsistency,Lint/RedundantCopDisableDirective
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attorney_firm_params
    params.require(:attorney_firm).permit(:firm_name_jp, :firm_name_en)
  end
end
