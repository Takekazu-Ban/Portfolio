class CreateHostCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :host_circles do |t|
      t.integer :user_id
      t.integer :circle_id
      t.integer :join_id
      t.string :message
      t.timestamps
    end
  end
end
