class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer "user_id"
      t.integer "admin_id"
      t.string "title"
      t.string "question"

      t.timestamps
    end
  end
end
