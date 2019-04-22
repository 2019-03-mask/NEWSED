class CartsController < ApplicationController

  #カート内一覧画面
  def index
    @cart_disc = Cart.where("user_id = '#{current_user.id}'")
  end

  #購入手続き画面
  def function
    @user_delivery = Cart.find_by(params[:user_id])
  end

  #購入確認画面
  def show
    @user = User.find(params[:id])
    @carts = Cart.where("user_id = '#{current_user.id}'")
    @buy_item = PurchaseHistory.new
  end

  #購入完了画面
  def complete
  end

  #カートに商品を入れるアクション
  def add_item
    cart_disc = Cart.new(cart_disc_params)
    cart_disc.item_id = params[:id]
    cart_disc.user_id = current_user.id
    #binding.pry
    cart_disc.save
    redirect_to items_path
  end

  #カート内の商品を編集するアクションakusyonn
  def update
  end

  def address_change
    user_delivery = Cart.find_by(params[:user_id])
    #binding.pry
    user_delivery.update(cart_disc_params)
    redirect_to cart_path(current_user)
  end

  def buy
    buy_item = PurchaseHistory.new
    buy_item.user_id = current_user.id
    buy_item.save
    redirect_to cart_complete_path
  end

  private
  def cart_disc_params
    params.require(:cart).permit(
      :cart_item, :delivery_address, :delivery_zip_code, :user_id,:item_id)
  end
end
