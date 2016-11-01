class RemoveIntegerFromSettings < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_settings, :integer
  end
end
