
class Movie < ApplicationRecord
 belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  
  scope :newest_movies, -> { order('created_at desc').limit(5) }
  scope :watched, -> { where(watched: true)} # Movie.watched, current_user.movies.watched
  
  # scope :newest_comment, -> {comments.order('created_at desc').limit(1)}
  before_validation :make_title_case

  validates_presence_of :title, :year, :description, :director


  def available?
    if self.watched != true
      return true
    else
      return false
    end  
  end

  # def self.newest_movies
  #   order('created_at desc').limit(5)    
  # end

  def newest_comment
    self.comments.order('created_at desc').limit(1)
  end

  def make_title_case
    self.title = self.title.titlecase
  end

  
end
