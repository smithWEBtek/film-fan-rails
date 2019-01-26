class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :director, :year
  has_many :comments
	belongs_to :genre
	belongs_to :user
end