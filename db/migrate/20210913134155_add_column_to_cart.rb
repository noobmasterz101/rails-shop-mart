class AddColumnToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_item_mappings, :item_name, :string
  end
end
