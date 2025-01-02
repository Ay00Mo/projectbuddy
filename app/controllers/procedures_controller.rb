class ProceduresController < ApplicationController
  before_action :authenticate_user!
  def new
    @procedure = Procedure.new
  end
end
