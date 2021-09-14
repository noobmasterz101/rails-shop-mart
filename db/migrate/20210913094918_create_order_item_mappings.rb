class CreateOrderItemMappings < ActiveRecord::Migration[6.1]
  def change
    create_table :order_item_mappings do |t|
      t.integer :quantity
      t.decimal :sub_cost
      t.belongs_to :order, foreign_key: true
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
