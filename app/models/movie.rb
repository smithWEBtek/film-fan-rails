class Movie < ApplicationRecord
  belongs_to :director
  has_many :movie_genre
  has_many :genres, :through => :movie_genre

  

  before_validation :make_title_case

  validates_presence_of :title, :user_watched, :rating, :comments

  def make_title_case
    self.title = self.title.titlecase
  end

  def genres_attributes=(genre_attributes)
    genre_attributes.values.each do |genre_attr|
      if !genre_attr[:name].blank?
        genre = Genre.find_or_create_by(genre_attr)
          self.genres << genre
      end
    end
  end
  
end
