class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.integer :task_is
      t.integer :user_id
      t.boolean :shared

      t.timestamps
    end
  end
end
