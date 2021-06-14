class WishListShoesController < ApplicationController
  def new
    @shoe = Shoe.new
  end

  def create
    #how do I pass shoe params from shoe controller
    @shoe = Shoe.new
    @wish_list.user = current_user
    @user = current_user
    if @shoe.save
      flash[:notice] = "Saved to Wish List"
      #redirecting to user show page - how to save in user wish list?
      redirect_to user_path(@user)
    else
      flash[:alert] = "Ooops, item not saved!"
      render :new
    end
  end
end
