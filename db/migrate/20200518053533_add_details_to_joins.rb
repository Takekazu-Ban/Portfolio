class AddDetailsToJoins < ActiveRecord::Migration[5.2]
  def change
    add_column :joins, :host_circle_id, :integer
  end
end
