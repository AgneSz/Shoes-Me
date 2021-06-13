class OutfitsController < ApplicationController
  before_action :set_outfit, only: [:show, :edit, :update, :destroy]

  def index
    @outfits = Outfit.all.order(created_at: :desc) # checked!
    @new_outfit = Outfit.new
    @user = current_user
  end

  def show
    @shoe = Shoe.new
    @shoes = @outfit.shoes
    @new_outfit = Outfit.new()
  end

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user
    @user = current_user
    if @outfit.save
      flash[:notice] = "Success!"
      redirect_to outfit_path(@outfit)
    else
      raise
      flash[:alert] = "Ooops, something went wrong!"
      render :new
    end
  end

  def edit
  end

  def update
    if @outfit.update(outfit_params)
      flash[:notice] = "Success!"
      redirect_to outfit_path(@outfit)
    else
      flash[:alert] = "Ooops, something went wrong!"
      render :edit
    end
  end

  def destroy
    @outfit.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:id])
  end

  def outfit_params
    params.require(:outfit).permit(:photo, :brand, :event_type, :event_date, :walking_time, category_ids: [])
  end
end
