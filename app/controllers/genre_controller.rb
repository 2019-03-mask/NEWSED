class GenreController < ApplicationController

before_action :authenticate_user!

  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	genre = Genre.new(genre_params)
  	genre.save
  	redirect_to new_item_path
  end

  private
  def genre_params
  	params.require(:genre).permit(:genre_name)
  end
end
