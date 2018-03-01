class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres


  before_validation :make_title_case
  validates :name, presence: true, uniqueness: true

  def make_title_case
    self.name = self.name.titlecase
  end
  
end
