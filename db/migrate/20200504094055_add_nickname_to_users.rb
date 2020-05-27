class AddNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :profile_image_id, :string
    add_column :users, :introduction, :string
    add_column :users, :gender,:integer
    add_column :users, :age, :integer
    #add_column :users, :created_at, :datetime
    #add_column :users, :updated_at, :datetime
    add_column :users, :is_deleted, :boolean,  default: false
  end
end
