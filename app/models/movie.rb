class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :format

  before_validation :make_title_case

  validates_presence_of :title, :user_watched, :rating, :comments, :format

  def make_title_case
    self.title = self.title.titlecase
  end
  
end
