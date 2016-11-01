class CreateUserSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_settings do |t|
      t.integer :baseInterval
      t.string :increaseMultiplier
      t.string :integer

      t.timestamps
    end
  end
end
