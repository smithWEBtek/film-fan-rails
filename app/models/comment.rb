class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie, dependent: :destroy


  validates :body, length: { minimum: 10 }
end
