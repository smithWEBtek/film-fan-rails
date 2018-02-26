class AddFormatToMovies < ActiveRecord::Migration[5.1]
  def change
    add_reference :movies, :format, foreign_key: true
  end
end
