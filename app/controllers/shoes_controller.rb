class ShoesController < ApplicationController
  before_action :set_outfit, only: [:new, :create, :edit, :update, :destroy]

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.outfit = @outfit
    if @shoe.save
      redirect_to outfits_path
    else
      render :new
    end
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    @shoe.destroy
    redirect_to outfits_path
  end

  def edit
    @shoe = Shoe.find(params[:id])
  end

  def update
    @shoe = Shoe.find(params[:id])
    @shoe.update(shoe_params)
    redirect_to outfits_path
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:outfit_id])
  end

  def shoe_params
    params.require(:shoe).permit(:brand)
  end
end
