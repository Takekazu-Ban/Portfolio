class AddCircles < ActiveRecord::Migration[5.2]
  def change
    add_column :circles, :join_user_id, :integer
  end
end
