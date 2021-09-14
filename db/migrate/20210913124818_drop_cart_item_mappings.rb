class DropCartItemMappings < ActiveRecord::Migration[6.1]
  def change
    drop_table :cart_item_mappings
  end
end
