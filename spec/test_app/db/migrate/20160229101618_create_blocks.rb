class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :title, null: false
      t.integer :user_id, null: false

      t.timestamp
    end
  end
end
