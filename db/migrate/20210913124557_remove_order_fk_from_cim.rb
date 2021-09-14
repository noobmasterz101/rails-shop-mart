class RemoveOrderFkFromCim < ActiveRecord::Migration[6.1]
  def change
    if foreign_key_exists?(:cart_item_mappings, :orders)
      remove_foreign_key :cart_item_mappings, :orders
    end
  end
end
