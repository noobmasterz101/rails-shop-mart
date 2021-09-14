class AddForeignKeyToShoppingCart < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :shopping_carts, :users
  end
end
