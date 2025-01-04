class ProceduresController < ApplicationController
  before_action :authenticate_user!
  def new
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def procedure_params
    params.require(:procedure).permit(:procedure_name)
  end
end
