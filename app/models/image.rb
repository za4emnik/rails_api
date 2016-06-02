class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :users
  paginates_per 2
  validates :user_id, :image, presence: true
end
