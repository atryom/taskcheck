class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :note
      t.integer :status_id
      t.integer :group_id
      t.integer :duration
      t.date :deadline
      t.integer :user_id

      t.timestamps
    end
  end
end
