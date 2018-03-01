class Movie < ApplicationRecord
  belongs_to :director
  has_many :movie_genres
  has_many :formats, :through => :movie_genres

  

  before_validation :make_title_case

  validates_presence_of :title, :user_watched, :rating, :comments

  def make_title_case
    self.title = self.title.titlecase
  end

  def format_attributes=(genre_attributes)
    genre_attributes.values.each do |genre_attr|
      if !genre_attr[:name].blank?
        genre = Genre.find_or_create_by(genre_attr)
          self.format << genre
      end
    end
  end
  
end
