class WelcomeController < ApplicationController
  before_action :require_user_logged_in!, only: [:add_to_cart]
  def index 
    @items = Item.all 
  end

  def add_to_cart 
    # byebug
    id = params[:id].to_i
    item = Item.find(id)
    q = params[:quantity].to_i
    if CartItemMapping.exists?(:item_id => id, :shopping_cart_id => @shopping_cart.id) == false
        new_item = @shopping_cart.cart_item_mappings.create({:item_id => id, :item_name => params[:name], :quantity => q, :sub_cost => q * item.price})
    end
    redirect_to home_path
  end
end
