
class User < ApplicationRecord
  has_secure_password 

  has_many :movies
  has_many :comments
  has_many :commented_movies, through: :comments, source: :movie
  has_one :directory
  

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, :password, :username, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 8 }

  #find or create by oauth user_id
  def self.set_user_from_omniauth(uid)
    #user logged in via OAuth
    first_or_create(uid: uid) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      #setting a random secure password if a new user
      u.password ||= SecureRandom.base58
    end
  end

  # def watched_movies
  #   @watched_movies = self.movies.find_all {|movie| movie.user_id == self.id}
  # end

  def create_directory
    new_directory = Directory.new
    self.id = new_directory.user_id
    new_directory.save
  end

  
end
