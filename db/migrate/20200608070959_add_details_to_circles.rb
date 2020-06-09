class AddDetailsToCircles < ActiveRecord::Migration[5.2]
  def change
    remove_column :circles, :position, :integer
  end
end
