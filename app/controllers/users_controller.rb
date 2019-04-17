class UsersController < ApplicationController
  def top
  end

  def edit
    @user = User.find(params[:id])
  end

  def purchase_history
  end

  def favorite
  end

  def delete
  end

  def index
  end

  def show
  end


  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_top(user.id)
  end


  def destroy
  end
end
