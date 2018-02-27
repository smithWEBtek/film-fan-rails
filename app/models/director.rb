class Director < ApplicationRecord

  belongs_to :user
  has_many :movies
  has_many :format, through: :movies

  before_validation :make_title_case

  validates_presence_of :name, :discovered, :rating

  def make_title_case
    self.name = self.name.titlecase
  end

end
