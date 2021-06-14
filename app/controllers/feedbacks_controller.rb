class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:destroy]

  def create
    @feedback = Feedback.new(feedback_params.merge(user: current_user, outfit: Outfit.find( params[:outfit_id])))
    if @feedback.save
      redirect_to outfit_path(Outfit.find( params[:outfit_id]))
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
    redirect_to user_path(@feedback.user)
    # @feedback.destroy
    # redirect_to my_account_path
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:user_id])
  end

  def feedback_params
    params.require(:feedback).permit(:content)
  end
end
