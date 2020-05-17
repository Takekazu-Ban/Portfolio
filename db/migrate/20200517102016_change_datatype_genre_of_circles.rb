class ChangeDatatypeGenreOfCircles < ActiveRecord::Migration[5.2]
  def change
    change_column :circles, :genre, :integer
  end
end
