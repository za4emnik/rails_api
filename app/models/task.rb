class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  paginates_per 10

  validates :user, :image_id, :params, :task_type, presence: true

  def self.search_image(id)
    image = Image.find (id)
  end

  def self.update_status(id, status)
    Task.where( id: id ).update_all( status: status )
  end

  def self.save_result
    
  end

end
