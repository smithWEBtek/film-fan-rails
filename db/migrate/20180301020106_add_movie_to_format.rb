class AddMovieToFormat < ActiveRecord::Migration[5.1]
  def change
    add_reference :format, :movie, foreign_key: true
  end
end
