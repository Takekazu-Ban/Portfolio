class AddUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :join_circle_id, :integer
  end
end
