class Movie < ApplicationRecord
 belongs_to :user
  belongs_to :genre
  has_many :comments
  

  before_validation :make_title_case

  validates_presence_of :title, :year, :description, :director


  def available
    if self.inventory != 0
      return true
    else
      return false
    end  
  end

  def favorite
    self.inventory = self.inventory - 1
    self.watched = true
    self.save
  end

  def self.newest_comment
    order('created_at desc').limit(5)    
  end

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
