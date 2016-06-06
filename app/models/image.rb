class Image < ActiveRecord::Base
  has_many :tasks
  #has_one :user, through: :tasks
  belongs_to :user
  mount_uploader :image, ImageUploader
  paginates_per 10
  validates :user_id, :image, presence: true
end
