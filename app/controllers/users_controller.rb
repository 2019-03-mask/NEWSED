class UsersController < ApplicationController
  def top
  end

  def edit
    @user = User.find(params[:id])
  end

  def purchase_history
  end

  def favorites
    @favorites = current_user.favorites
  end

  def delete
    @user = current_user
  end

  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to top_path
  end


  def destroy
  end

  private
  def user_params
    params.require(:user).permit(
      :email, :last_name, :first_name,
      :last_name_kana, :first_name_kana,
      :zip_code, :address, :phone_number)
  end

end
