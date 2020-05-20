class Records < ActiveRecord::Migration[5.2]
  def change
    drop_table :circle_chats
  end
end
