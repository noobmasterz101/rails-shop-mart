class AddUserToShoppingCart < ActiveRecord::Migration[6.1]
  def change
    add_reference :shopping_carts, :user
  end
end
