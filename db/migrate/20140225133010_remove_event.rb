class RemoveEvent < ActiveRecord::Migration
  def change
    remove_column :events, :eventable_id
  end
end
