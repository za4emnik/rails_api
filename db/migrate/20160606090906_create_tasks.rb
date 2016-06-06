class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user, null: false, index: true
      t.references :image, null: false, index: true
      t.string :task_type, null: false
      t.string :params, null: false
      t.timestamps null: false
    end
  end
end
