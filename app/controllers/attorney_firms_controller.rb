class AttorneyFirmsController < ApplicationController
  def new
    @attorney_firm = AttorneyFirm.new
  end
end
