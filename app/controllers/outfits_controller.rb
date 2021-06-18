class OutfitsController < ApplicationController
  before_action :set_outfit, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index
  def index
    @outfits = Outfit.includes(:shoes).order(created_at: :desc) # checked!
    @new_outfit = Outfit.new
    @user = current_user
    @feedback = Feedback.new
  end

  def show
    @shoe = Shoe.new
    @shoes = @outfit.shoes
    @new_outfit = Outfit.new()
    if @shoes
      shoe_ids = @shoes.map(&:id)
      category_names = @shoes.map(&:categories).flatten.map(&:name).uniq
      @recommended_shoe = Shoe.joins(:categories).where.not(id: shoe_ids).where('categories.name in (?)', category_names).uniq.first
    end
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

  def trending
    @trending_shoes = Shoe.all.sort_by { |shoe| -shoe.votes_for.size }.first(3)
    @new_outfit = Outfit.new
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:id])
  end

  def outfit_params
    params.require(:outfit).permit(:photo, :brand, :event_type, :event_date, :walking_time, category_ids: [])
  end
end
