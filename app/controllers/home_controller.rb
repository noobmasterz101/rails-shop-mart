class HomeController < ApplicationController
    before_action :current_shopping_cart
    after_action :clear_cart_total, only: [:place_order] 
    def index 
        @items = Item.all 
        puts "----------"
        puts @shopping_cart
        puts "----------"

    end

    def add_to_cart 
        id = params[:id].to_i
        item = Item.find(id)
        q = params[:quantity].to_i
        if CartItemMapping.exists?(:item_id => id, :shopping_cart_id => @shopping_cart.id) == false
            new_item = @shopping_cart.cart_item_mappings.create({:item_id => id, :item_name => params[:name], :quantity => q, :sub_cost => q * item.price})
        end
        redirect_to home_path
    end

    def remove_from_cart

    end

    def place_order 
        puts "@cart_total"
        puts @cart_total
        cost = params[:cart_total].to_d
        order = Current.user.orders.create({:cost => cost, :status => "placed"})
        @shopping_cart.cart_item_mappings.each do |mapping|
            order.order_item_mappings.create({:item_id => mapping.item_id, :quantity => mapping.quantity, :sub_cost => mapping.sub_cost})
        end
        @shopping_cart.cart_item_mappings.destroy_all
        redirect_to home_path, notice: "order placed succesfully"
    end 
        
    def show_user_orders
        @orders = Current.user.orders
    end

    private 
    def clear_cart_total
        @cart_total = 0
    end
end