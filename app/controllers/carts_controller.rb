class CartsController < ApplicationController

  before_action :authenticate_user!
  before_action :cart_confirmation, only:[:update, :delete, :address_change]
  #カート内一覧画面
  def index
    @carts = current_user.carts.where(deleted_at: nil)
  end

  #購入手続き画面
  def function
    @user_delivery = Cart.last
    @user_delivery.delivery_zip_code = current_user.zip_code
    @user_delivery.delivery_address = current_user.address
  end

  #購入確認画面
  def show
    @user = current_user
    @carts = current_user.carts.where(deleted_at: nil)
    @buy_item = PurchaseHistory.new
  end

  #購入完了画面
  def complete
  end

  #カートに商品を入れるアクション
  def add_item
    #商品に対してカートが作られているかどうかでアクションが変わる
    #ある場合⇨cart_itemの個数が変更される
    #ない場合⇨新たにカートを作成する
    item = Item.find(params[:id])
    current_cart = current_user.carts
     #同じ商品を買うときはすでにあるカートの中の個数を増やす
     #Cart.find_by(item_id: params[:id]) && Cart.find_by(user_id: current_user.id)
    if current_cart.exists?(:item_id => params[:id])
       cart = current_user.carts.find_by(item_id: params[:id])
       add_stock = cart.cart_item + params[:cart][:cart_item].to_i
       cart.update(cart_item: add_stock)
       #カートに入れた商品の数をアイテムから引く
       stock = item.stock - params[:cart][:cart_item].to_i
       item.stock = stock
       item.save
    else
       cart_disc = Cart.new(cart_disc_params)
       cart_disc.item_id = params[:id]
       cart_disc.user_id = current_user.id
       cart_disc.save
       #カートに入れた商品の数をアイテムから引く
       stock = item.stock - params[:cart][:cart_item].to_i
       item.stock = stock
       item.save
    end
    redirect_to items_path
  end

  #カート内の商品を編集するアクション
  def update
    cart = Cart.find(params[:id])
    cart.update(cart_update_params)
  #カートに入れた数だけ在庫数を減らす
    stock = cart.item.stock - cart.cart_item
    item = cart.item
    item.stock = stock
    item.save
    redirect_to carts_path
  end

  #カート内で商品を削除するアクション
  #⇨カートモデルのレコードを削除する
  def delete
    cart = Cart.find(params[:id])
    cart.destroy
  #カートから削除した分だけ在庫数を増やす
    stock = cart.item.stock + cart.cart_item
    item = cart.item
    item.stock = stock
    item.save
    redirect_to carts_path
  end

  #カートテーブルの配送先住所を入力するアクション
  def address_change
    cart = Cart.last
    cart.update(address_change_params)
    redirect_to cart_path(cart.id)
  end

  #カート内の商品を購入履歴に反映させるアクション
  def buy
    carts = current_user.carts.where(deleted_at: nil)
    buy_item = PurchaseHistory.new
    carts.each do |cart|
      buy_item.cart_id = cart.id
      buy_item.user_id = current_user.id
      buy_item.bought_price = cart.item.price
      buy_item.save
      cart.destroy
    end
      redirect_to cart_complete_path
  end

  #カートに商品が入っていない場合にURLからアクセスしようとした時のアクション
  def cart_confirmation
    @carts = current_user.carts.where(deleted_at: nil)
    if @carts.empty?
      flash[:notice] = "商品が選択されていません"
      redirect_to carts_path
    end
  end

  private
  def cart_disc_params
    params.require(:cart).permit(
      :cart_item, :delivery_address, :delivery_zip_code, :user_id, :item_id)
  end

  def cart_update_params
     params.require(:cart).permit(:cart_item)
  end

  def address_change_params
    params.require(:cart).permit(
      :delivery_address, :delivery_zip_code)
  end

  def _params
    params.require(:user).permit(:name, :profile_image)
end
end
