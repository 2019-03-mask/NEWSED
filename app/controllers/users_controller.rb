class UsersController < ApplicationController
  def top
  end

  def edit
    @user = User.find(params[:id])
  end

  def admin_edit
    @user = User.find(params[:id])
  end

  def admin_update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to top_path
  end

  def purchase_history
    @user = current_user
    @histories = @user.purchase_histories
    @carts = current_user.carts
    @bought = @carts.with_deleted
    # binding.pry
  end

  PER = 1
  def favorites
    @favorites = current_user.favorites.page(params[:page]).per(PER).reverse_order
    @items = Item.page(params[:page]).per(12)
  end

  def delete
    user = current_user
    user.destroy
    redirect_to top_path
  end

  PER = 3
  def index
    @users = User.all.page(params[:page]).per(PER).reverse_order
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(PER).reverse_order
    @items = Item.page(params[:page]).per(12)
  end

  def show
    @user = User.find(params[:id])
    @histories = @user.purchase_histories
    @carts = current_user.carts
    @bought = @carts.with_deleted
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to top_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(
      :email, :last_name, :first_name,
      :last_name_kana, :first_name_kana,
      :zip_code, :address, :phone_number)
  end

end
