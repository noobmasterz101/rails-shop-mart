class Item < ApplicationRecord
    has_and_belongs_to_many :shopping_carts
    has_many :order_item_mappings
    has_many :cart_item_mappings
end
