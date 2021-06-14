class WishesController < ApplicationController
  def create
    @wish = Wish.new
    @user = current_user
    @shoe = Shoe.find(params[:shoe_id])
    @wish.user = @user
    @wish.shoe = @shoe
    @wish.save
    redirect_to outfit_path(@shoe.outfit)
  end
end
