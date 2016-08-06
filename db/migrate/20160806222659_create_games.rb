class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :gameName
      t.string :filepath

      t.timestamps
    end
  end
end
