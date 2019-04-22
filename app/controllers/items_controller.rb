class ItemsController < ApplicationController
  def index
    @items = Item.where("item_states = '新品'")
    @search = Artist.ransack(params[:q])
    @artists = @search.result
  end

  def index_used
    @items = Item.where("item_states = '中古'")
  end

  def show
    @item = Item.find(params[:id])
    @discs = @item.discs
    #@songs = @discs.map{|disc| disc.songs}
    #@songs = Song.where("disc_id = '#{@item.id}'")
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
    params.require(:item).permit(:item_name, :item_image_id, :item_states, :item_type, :price, :stock, :deleted_at, :artist_id, :lable_id, :genre_id, discs_attributes: [:id, :disc_name, :item_id,:_destroy, songs_attributes: [:id, :song_title, :disc_id, :_destroy]])
  end
end
