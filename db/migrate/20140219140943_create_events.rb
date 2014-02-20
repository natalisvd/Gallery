class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :eventable_type
      t.integer :eventable_id
      t.integer :user_id
      t.text :eventable_body

      t.timestamps
    end
  end
end