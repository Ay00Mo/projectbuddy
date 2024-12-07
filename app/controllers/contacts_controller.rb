class ContactsController < ApplicationController
  before_action :authenticate_user!
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private # rubocop:disable Layout/EmptyLinesAroundAccessModifier
  def contact_params
    params.require(:contact).permit(:last_name_jp, :first_name_jp, :last_name_en, :first_name_en)
  end
end
