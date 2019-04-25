class ReviewsController < ApplicationController

    before_action :authenticate_user!

	def create
	  review = Review.new(review_params)
	  review.item_id = params[:item_id]
	  review.user_id = current_user.id
	  review.save
	  redirect_to item_path(params[:item_id])
	end

	def destroy
	  item = Item.find(params[:item_id])
      review = current_user.reviews.find_by(item_id: item.id)
      review.destroy
      redirect_to item_path(item.id)
	end

	private
	def review_params
	  params.require(:review).permit(:review_title, :review_text, :user_id, :item_id)
	end
end