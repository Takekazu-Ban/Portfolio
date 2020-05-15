class RemoveAuthorFromCircles < ActiveRecord::Migration[5.2]
  def change
    remove_column :circles, :join_user_id, :integer
    remove_column :users, :join_circle_id, :integer
  end
end
