class ChangeReferenceKeyFromFeedbacks < ActiveRecord::Migration[6.0]
  def change
    remove_reference :feedbacks, :shoe
    add_reference :feedbacks, :outfit
  end
end
