class ShoesController < ApplicationController
  before_action :set_outfit, only: [:new, :create, :edit, :update]
  before_action :set_shoe, only: [:edit, :update, :destroy]

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

  private

  def set_outfit
    @outfit = Outfit.find(params[:outfit_id])
  end

  def set_shoe
    @shoe = Shoe.find(params[:id])
  end

  def shoe_params
    params.require(:shoe).permit(:brand)
  end
end
