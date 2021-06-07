class OutfitsController < ApplicationController
  before_action :set_outfit, only: [:show, :edit, :update, :destroy]

  def index
    @outfits = Outfit.all
  end

  def show
  end

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user
    if @outfit.save
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @outfit.update(outfit_params)
    redirect_to outfit_path(@outfit)
  end

  def destroy
    @outfit.destroy
    redirect_to my_account_path
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:id])
  end

  def outfit_params
    params.require(:outfit).permit(:brand, :photo)
  end
end
