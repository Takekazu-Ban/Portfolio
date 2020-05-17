class AddColumJoins < ActiveRecord::Migration[5.2]
  def change
    add_column :joins, :admin_id, :integer 
    add_column :circles, :admin_id, :integer 
  end
end
