class ContactsController < ApplicationController

before_action :authenticate_user!, only: [:top, :create, :show, :index]
before_action :ensure_correct_user, only:[:show, :index]


  def top
  	@contact = Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
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

  def ensure_correct_user
    if current_user.admin == false
      flash[:notice] = "このアクションは許可されていません"
      redirect_to top_users_path
    end
  end

  private
  def contact_params
  	params.require(:contact).permit(:contact_title, :contact_text)
  end
end
