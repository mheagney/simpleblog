class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true
  validates :password, confirmation: true
end
