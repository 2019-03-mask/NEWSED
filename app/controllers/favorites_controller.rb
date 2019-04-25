class FavoritesController < ApplicationController

before_action :authenticate_user!

	def create
	  favorite = Favorite.new
	  favorite.item_id = params[:item_id]
	  favorite.user_id = current_user.id
	  favorite.save
	  redirect_to item_path(params[:item_id])
	end

	def destroy
	  item = Item.find(params[:item_id])
      favorite = current_user.favorites.find_by(item_id: item.id)
      favorite.destroy
      redirect_to item_path(item.id)
	end
end
