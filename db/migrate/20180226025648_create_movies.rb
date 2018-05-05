class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|

      t.string :title
      t.integer :year
      t.integer :director_id
      t.integer :genre_id
      t.text :description
      t.integer :user_id
      t.boolean :watched, default: false
      

      t.timestamps
    end
  end
end
