class WishesController < ApplicationController
  def create
    @wish = Wish.new
    @user = current_user
    @shoe = Shoe.find(params[:shoe_id])
    @wish.user = @user
    @wish.shoe = @shoe
    @wish.save
    outfit = Outfit.find(params["outfit_id"])
    redirect_to outfit_path(outfit)
  end
end
