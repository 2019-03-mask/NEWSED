class LableController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_correct_user, only:[:create]

  def index
  	@lable = Lable.new
    @lables = Lable.all
  end

  def create
  	lable = Lable.new(lable_params)
  	lable.save
  	redirect_to new_item_path
  end

  def ensure_correct_user
    if current_user.admin == false
      flash[:notice] = "許可されていないアクションです"
      redirect_to top_users_path
    end
  end

  private

  def lable_params
  	params.require(:lable).permit(:lable_name)
  end
end
