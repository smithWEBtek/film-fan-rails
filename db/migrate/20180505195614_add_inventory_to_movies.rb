class AddInventoryToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :inventory, :integer
  end
end
