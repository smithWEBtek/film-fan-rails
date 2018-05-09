class Genre < ApplicationRecord
has_many :movies

accepts_nested_attributes_for :movies

  
  validates :name, presence: true, uniqueness: true

  
  
end
