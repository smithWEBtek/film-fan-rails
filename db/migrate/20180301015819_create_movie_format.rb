class CreateMovieFormat < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_format do |t|
      t.integer :movie_id
      t.integer :genre_id
    end
  end
end
