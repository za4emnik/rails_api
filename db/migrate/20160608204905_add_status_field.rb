class AddStatusField < ActiveRecord::Migration
  def change
    add_column :tasks, :status, :string, :default => 'new'
  end
end
