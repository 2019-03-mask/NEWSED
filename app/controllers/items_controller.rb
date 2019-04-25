class ItemsController < ApplicationController
  PER = 12
  def index
     @search = Item.where("item_states = '新品'").ransack(params[:q])
    if params[:q].present?
      @items = @search.result.page(params[:page]).per(PER).reverse_order
    else
      @items = Item.where("item_states = '新品'").page(params[:page]).per(PER).reverse_order
    end
    @rank = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
  end

  def index_used
      @search = Item.where("item_states = '中古'").ransack(params[:q])
    if params[:q].present?
      @items = @search.result.page(params[:page]).per(PER).reverse_order
    else
      @items = Item.where("item_states = '中古'").page(params[:page]).per(PER).reverse_order
    end
    @rank = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
  end

  def show
    @item = Item.find(params[:id])
    # @discs = @item.discs
    #@songs = @discs.map{|disc| disc.songs}
    #@songs = Song.where("disc_id = '#{@item.id}'")
    # @user = User.find(params[:id])
    @review = Review.new
    @cart_disc = Cart.new
  end

  def new
    @item = Item.new
    @artists = Artist.all
    @genres = Genre.all
    @lables = Lable.all
  end

  def edit
    @item = Item.find(params[:id])
    @artists = Artist.all
    @genres = Genre.all
    @lables = Lable.all
  end

  def create
    item = Item.new(item_params)
    item.save
    if item.item_states == '新品'
      redirect_to items_path
    else
      redirect_to index_used_items_path
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end

  def status
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_image, :item_states, :item_type, :price, :stock, :deleted_at, :artist_id, :lable_id, :genre_id, discs_attributes: [:id, :disc_name, :item_id,:_destroy, songs_attributes: [:id, :song_title, :disc_id, :_destroy]])
  end
end
