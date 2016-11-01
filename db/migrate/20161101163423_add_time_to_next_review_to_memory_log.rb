class AddTimeToNextReviewToMemoryLog < ActiveRecord::Migration[5.0]
  def change
    add_column :memory_logs, :time_to_next_review, :integer
  end
end
