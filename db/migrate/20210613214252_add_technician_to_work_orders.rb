class AddTechnicianToWorkOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :work_orders, :technician
    add_reference :work_orders, :location
  end
end
