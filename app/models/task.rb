class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  paginates_per 10

  validates :user_id, :image, :params, :task_type, presence: true
end
