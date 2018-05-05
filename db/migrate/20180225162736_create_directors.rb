class CreateDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :directors do |t|

      t.string :name
      t.integer :user_id
      t.boolean :favorite, default: false
      t.integer :rating
      t.string :notes

      t.timestamps
    end
  end
end
