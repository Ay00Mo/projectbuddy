class CasesController < ApplicationController
  def index
  end

  def new
    @case = Case.new
  end
end
