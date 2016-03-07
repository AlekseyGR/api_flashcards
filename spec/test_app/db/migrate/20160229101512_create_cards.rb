class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string  :original_text
      t.string  :translated_text
      t.date    :review_date
      t.integer :user_id,  null: false
      t.integer :block_id, null: false

      t.timestamp
    end
  end
end
