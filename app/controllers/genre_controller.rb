class GenreController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_correct_user, only:[:create]

  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	genre = Genre.new(genre_params)
  	genre.save
  	redirect_to new_item_path
  end

  def ensure_correct_user
    if current_user.admin == false
      flash[:notice] = "許可されていないアクションです"
      redirect_to top_users_path
    end
  end

  private
  def genre_params
  	params.require(:genre).permit(:genre_name)
  end
end
