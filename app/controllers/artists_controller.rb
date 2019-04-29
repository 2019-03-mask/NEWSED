class ArtistsController < ApplicationController

  #機能制限をかける

  def new_item
    @artist = Artist.find(params[:id])
    @items = @artist.items.where(item_states: "新品")
  end

  def used_item
    @artist = Artist.find(params[:id])
    @items = @artist.items.where(item_states: "中古")
  end

  def show
    @artist = Artist.find(params[:id])
    @items = @artist.items
  end

  def new
  	@artist = Artist.new
  	@artists = Artist.all
  end

  def create
  	artist = Artist.new(artist_params)
  	artist.save
  	redirect_to new_item_path
  end

  def destroy
  end

  private

  def artist_params
  	params.require(:artist).permit(:artist_name, :artist_image)
  end
end
