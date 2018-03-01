class AddMovieToGenres < ActiveRecord::Migration[5.1]
  def change
    add_reference :genres, :movie, foreign_key: true
  end
end
