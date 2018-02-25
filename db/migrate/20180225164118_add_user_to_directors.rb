class AddUserToDirectors < ActiveRecord::Migration[5.1]
  def change
    add_reference :directors, :user, foreign_key: true
  end
end
