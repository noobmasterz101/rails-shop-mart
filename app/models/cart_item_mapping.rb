class CartItemMapping < ApplicationRecord
    belongs_to :item
    belongs_to :shopping_cart
end
