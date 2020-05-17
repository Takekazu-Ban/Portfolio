class AddDatailsToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :user_id, :integer
  end
end
