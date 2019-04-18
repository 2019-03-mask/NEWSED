class ItemsController < ApplicationController
  def index
  end

  def index_used
  end

  def show
  end

  def new
    @item = Item.new
    @disc = @item.discs.build
    @song = @disc.songs.build
    @artists = Artist.all
    @genres = Genre.all
    @lables = Lable.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    item.save
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
    params.require(:item).permit(:item_type, :item_name, :price, :item_image, :stock, discs_attributes: [:id, :disc_name, :_destroy, songs_attributes: [:id, :song_title, :_destroy]])
  end
end
