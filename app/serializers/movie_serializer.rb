class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :comments
end