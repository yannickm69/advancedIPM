class CreateWorkOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :work_orders do |t|
      t.datetime :time
      t.integer :duration
      t.decimal :price

      t.timestamps
    end
  end
end
