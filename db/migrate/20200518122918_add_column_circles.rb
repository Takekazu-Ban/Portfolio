class AddColumnCircles < ActiveRecord::Migration[5.2]
  def change
    add_column :circles, :host_circle_id, :integer
 
  end
end
