class CreateCartItemMappings < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_item_mappings do |t|
      t.integer :quantity
      t.decimal :sub_cost
      t.belongs_to :shopping_cart, foreign_key: true
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
