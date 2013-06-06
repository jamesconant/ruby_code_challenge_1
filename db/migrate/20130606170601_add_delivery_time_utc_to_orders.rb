class AddDeliveryTimeUtcToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_time_utc, :integer
  end
end
