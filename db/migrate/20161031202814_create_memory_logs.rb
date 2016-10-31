class CreateMemoryLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :memory_logs do |t|
      t.datetime :timestamp
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
