class User < ApplicationRecord
  attr_accessor :password_digest
  has_secure_password
  has_many :posts

  validates :email, uniqueness: { case_sensitive: false }
end
