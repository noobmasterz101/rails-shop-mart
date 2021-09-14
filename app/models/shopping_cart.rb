class ShoppingCart < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :items
    has_many :cart_item_mappings
    has_many :order_item_mappings
end
