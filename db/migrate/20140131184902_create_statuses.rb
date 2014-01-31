class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.integer :order_num

      t.timestamps
    end
  end
end
