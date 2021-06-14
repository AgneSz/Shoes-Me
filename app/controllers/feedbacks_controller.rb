class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user
    @feedback.outfit = Outfit.find(params[:outfit_id])
    if @feedback.save
      redirect_to outfits_path
      # path to change to user_path(@user) (or profile path but something to do with where useres view their own bookings)
    else
      render :new
    end
  end

  # def update
  #   @feedback.update(feedback_params)
  #   redirect_to outfit_path(@outfit)
  # end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to outfits_path
    # @feedback.destroy
    # redirect_to my_account_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end
end
