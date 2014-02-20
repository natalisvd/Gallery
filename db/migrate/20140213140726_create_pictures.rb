class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :category_id
      t.string :url
      t.string :title
      t.timestamps
    end
  end
end
