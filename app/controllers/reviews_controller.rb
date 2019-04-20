class ReviewsController < ApplicationController
	def create
	  # item = Item.find(params[:item_id])
	  # review = Review.new(review_params)
	  # review.item_id = item.id
	  # review.user_id = current_user.id
	  # review.save
	  # redirect_to item_path(item.id)

	  # binding.pry

	  review = Review.new(review_params)
	  review.item_id = params[:item_id]
	  review.user_id = current_user.id
	  review.save
	  redirect_to item_path(params[:item_id])
	end

	def destroy
	end

	private
	def review_params
	  params.require(:review).permit(:review_title, :review_text, :user_id, :item_id)
	end
end