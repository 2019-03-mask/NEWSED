class LableController < ApplicationController
  def index
  	@lable = Lable.new
    @lables = Lable.all
  end

  def create
  	lable = Lable.new(lable_params)
  	lable.save
  	redirect_to new_item_path
  end

  private

  def lable_params
  	params.require(:lable).permit(:lable_name)
  end
end
