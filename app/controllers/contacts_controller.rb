class ContactsController < ApplicationController
  def top
  	@contact = Contact.new
  end

  def show
  end

  def index
  end

  def create
  	contact = Contact.new(contact_params)
  	user_id = current_user_id
  	contact.save
  end

  private

  def contact_params
  	params.require(:contact).permit(:last_name, :first_name, :email, :contact_title, :contact_text)
end
