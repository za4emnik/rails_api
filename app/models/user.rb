class User < ActiveRecord::Base
  has_many :sessions
  has_many :images

  has_secure_password validations: :false
  validates :email, uniqueness: true
  validates :name, :email, :password, presence: true, length: { minimum: 5 }
  attr_accessible :password, :name, :email
end
