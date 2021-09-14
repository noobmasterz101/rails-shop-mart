class DropItemsShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    drop_table :items_shopping_carts
  end
end
