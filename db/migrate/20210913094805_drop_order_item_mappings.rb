class DropOrderItemMappings < ActiveRecord::Migration[6.1]
  def change
    drop_table :order_item_mappings
  end
end
