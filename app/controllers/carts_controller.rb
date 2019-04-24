class CartsController < ApplicationController

  #カート内一覧画面
  def index
    @carts = current_user.carts.where(deleted_at: nil)
    # @product = current_user.carts.find_by(id: params[:user_id])
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
    #商品に対してカートが作られているかどうかでアクションが変わる
    #ある場合⇨cart_itemの個数が変更される
    #ない場合⇨新たにカートを作成する
    item = Item.find(params[:id])
    current_cart = current_user.carts
    if Cart.find_by(item_id: params[:id]) && Cart.find_by(user_id: current_user.id)
     cart = current_user.carts.find_by(item_id: params[:id])
     #binding.pry
     add_stock = cart.cart_item + params[:cart][:cart_item].to_i
     cart.update(cart_item: add_stock)
     #カートに入れた商品の数をアイテムから引く
     stock = item.stock - params[:cart][:cart_item].to_i
     item.stock = stock
     item.save
   else #同じ商品を買うときはすでにあるカートの中の個数を増やす
     cart_disc = Cart.new(cart_disc_params)
     cart_disc.item_id = params[:id]
     cart_disc.user_id = current_user.id
     #binding.pry
     cart_disc.save
     #カートに入れた商品の数をアイテムから引く
     stock = item.stock - params[:cart][:cart_item].to_i
     item.stock = stock
     item.save
    end
    redirect_to items_path
  end

  #カート内の商品を編集するアクション
  #⇨カートモデルのcart_itemカラムを変更する
  def update
    cart = Cart.find(params[:id])
    cart.update(cart_update_params)

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

    stock = cart.item.stock + cart.cart_item
    item = cart.item
    item.stock = stock
    item.save
    redirect_to carts_path
  end

  #カートテーブルの配送先住所を入力するアクション
  def address_change
    user_delivery = Cart.where("user_id = '#{current_user.id}'")
    carts = current_user.carts
    #binding.pry
    carts.each do |cart|
      if cart.delivery_address.nil?
        cart.delivery_address = params[:cart][:delivery_address]
      end
      if cart.delivery_zip_code.nil?
        cart.delivery_zip_code = params[:cart][:delivery_zip_code]
      end
      cart.save
    end
    redirect_to cart_path(current_user)
  end

  #カート内の商品を購入履歴に反映させるアクション
  def buy
    carts = current_user.carts.where(deleted_at: nil)
    buy_item = PurchaseHistory.new
    #binding.pry
    carts.each do |cart|
      cart.destroy
      buy_item.cart_id = cart.id
      buy_item.user_id = current_user.id
      buy_item.bought_price = cart.item.price
      buy_item.save
    end
    redirect_to cart_complete_path
  end

  private
  def cart_disc_params
    params.require(:cart).permit(
      :cart_item, :delivery_address, :delivery_zip_code, :user_id, :item_id)
  end

  def cart_update_params
     params.require(:cart).permit(:cart_item)
  end

end
