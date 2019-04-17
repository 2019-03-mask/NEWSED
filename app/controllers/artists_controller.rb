class ArtistsController < ApplicationController
  def index
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
