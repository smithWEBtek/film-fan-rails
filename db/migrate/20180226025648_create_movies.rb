class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|

      t.string :title
      t.string :user_watched
      t.integer :rating
      t.string :comments

      t.timestamps
    end
  end
end
