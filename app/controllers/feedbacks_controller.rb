class FeedbacksController < ApplicationController
  # before_action :set_feedback, only: [:update, :destroy]
  # def create
  #   @feedback = Feedback.new(feedback_params)
  #   @feedback.save
  #   redirect_to outfit_path(@outfit)
  # end

  # def update
  #   @feedback.update(feedback_params)
  #   redirect_to outfit_path(@outfit)
  # end

  # def destroy
  #   @feedback.destroy
  #   redirect_to my_account_path
  # end

  # private

  # def set_feedback
  #   @feedback = Feedback.find(params[:id])
  # end

  # def feedback_params
  #   params.require(:feedback).permit(:content)
  # end
end
