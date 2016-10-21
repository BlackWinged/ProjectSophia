class CreatePhotowords < ActiveRecord::Migration[5.0]
  def change
    create_table :photowords do |t|
      t.string :caption
      t.string :path

      t.timestamps
    end
  end
end
