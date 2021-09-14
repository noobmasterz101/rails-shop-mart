class AddColumnToItemsShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :items_shopping_carts, :quantity, :integer
  end
end
