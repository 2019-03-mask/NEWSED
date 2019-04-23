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
  	contact.user_id = current_user.id
  	contact.save
    redirect_to top_users_path
  end

  private

  def contact_params
  	params.require(:contact).permit(:contact_title, :contact_text)
  end
end
