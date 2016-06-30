class AddFieldForRemoteImage < ActiveRecord::Migration
  def change
    add_column :tasks, :processed_image, :string
  end
end
