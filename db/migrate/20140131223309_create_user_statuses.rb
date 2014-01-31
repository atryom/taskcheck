class CreateUserStatuses < ActiveRecord::Migration
  def change
    create_table :user_statuses do |t|
      t.string :name
      t.integer :order_num
      t.integer :user_id

      t.timestamps
    end
  end
end
