class ContactsController < ApplicationController
  def top
  	@contact = Contact.new
  end

  def show
  end

  def index
      @contacts = Contact.all
  end

  def create
  	contact = Contact.new(contact_params)
  	contact.save
    redirect_to items_path
  end

  private

  def contact_params
  	params.require(:contact).permit(:last_name, :first_name, :email, :contact_title, :contact_text)
  end
end
