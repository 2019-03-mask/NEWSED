class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.new
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
  end

  private
  def item_params
    params.require(:item).permit(:item_type, :item_name, :price, :item_image, :stock, :artist_id, :lable_id, :genre_id)
  end
end
