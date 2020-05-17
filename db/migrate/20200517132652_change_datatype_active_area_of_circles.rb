class ChangeDatatypeActiveAreaOfCircles < ActiveRecord::Migration[5.2]
  def change
    change_column :circles, :active_area, :integer
  end
end
