class AddSettingIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_setting_id, :integer
  end
end
