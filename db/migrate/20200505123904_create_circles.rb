class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.string :genre
      t.string :active_area
      t.string :age_group
      t.string :circle_name
      t.string :circle_img_id
      t.string :explanation
      t.string :place
      t.string :area_show
      t.integer :recruitment
      t.integer :cost
      t.integer :count
      t.integer :user_id
      t.timestamps
    end
  end
end
