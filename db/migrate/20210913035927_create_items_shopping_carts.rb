class CreateItemsShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :items_shopping_carts do |t|
      t.references :item, null: false, foreign_key: true
      t.references :shopping_cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
