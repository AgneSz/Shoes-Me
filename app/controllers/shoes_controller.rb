class ShoesController < ApplicationController
  before_action :set_outfit, only: [:new, :create, :edit, :update]
  before_action :set_shoe, only: [:edit, :update, :destroy, :like]

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.outfit = @outfit
    if @shoe.save
      flash[:notice] = "Success, your shoes have been created!"
      redirect_to outfit_path(@outfit)
    else
     flash[:alert] = "Ooops, something went wrong!"
      render :new
    end
  end

  def destroy
    @outfit = @shoe.outfit
    @shoe.destroy
    redirect_to outfit_path(@outfit)
  end

  def edit
  end

  def update
    @shoe.update(shoe_params)
    redirect_to outfit_path(@outfit)
  end

  def like
    @outfit = @shoe.outfit
    liked_shoe_outfit = Outfit.find(params[:vote_scope])
    current_user.find_liked_items(vote_scope: liked_shoe_outfit.id).each do |shoe|
      shoe.unliked_by current_user, vote_scope: liked_shoe_outfit.id
    end
    if params[:format] == "like"
      @shoe.liked_by current_user, vote_scope: liked_shoe_outfit.id
    elsif params[:format] == "unlike"
      @shoe.unliked_by current_user, vote_scope: liked_shoe_outfit.id
    end
    if params[:from] == "index"
      redirect_to outfits_path(anchor: "shoe-#{@shoe.id}")
    else
      redirect_to outfit_path(@outfit, anchor: "shoe-#{@shoe.id}")
    end
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:outfit_id])
  end

  def set_shoe
    @shoe = Shoe.find(params[:id])
  end

  def shoe_params
    params.require(:shoe).permit(:photo, category_ids: [])
  end
end
