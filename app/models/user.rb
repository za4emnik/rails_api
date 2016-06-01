class User < ActiveRecord::Base
  has_secure_password validations: :false
  validates :name, :email, :password, presence: true, length: { minimum: 5 }
  validates :email, uniqueness: true
  #attr_accessible :password, :email, :namessssss
end
