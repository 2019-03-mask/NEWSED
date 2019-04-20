class ItemsController < ApplicationController
  def index
    @items = Item.where("item_states = '新品'")
  end

  def index_used
    @items = Item.where("item_states = '中古'")
  end

  def show
    @item = Item.find(params[:id])
    @songs = Song.where("disc_id = '#{@item.id - 1}'")
    @review = Review.new
  end

  def new
    @item = Item.new
    @item_id = Item.last
    @disc = @item.discs.new
    @song = @disc.songs.new
    @artists = Artist.all
    @genres = Genre.all
    @lables = Lable.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    item.save!
    redirect_to items_path
  end

  def destroy
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
    params.require(:item).permit(:artist_id, :lable_id, :genre_id, :item_states, :item_type, :item_name, :price, :item_image, :stock, discs_attributes: [:id, :disc_name, :item_id,:_destroy, songs_attributes: [:id, :song_title, :disc_id, :_destroy]])
  end
end
