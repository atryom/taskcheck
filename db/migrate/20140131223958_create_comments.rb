class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :task_is
      t.integer :user_id

      t.timestamps
    end
  end
end
