class HomeController < ApplicationController
    before_action :set_current_user, :current_shopping_cart, :require_user_logged_in!
    after_action :clear_cart_total, only: [:place_order] 
    def index 
        @items = Item.all 
    end

    def add_to_cart 
        p params
        # byebug
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
        # byebug
        initial_cost = params[:cart_total].to_d
        code = params[:coupon_code]
        coupon = Coupon.find_by(code: code)

        if code ==  "" or coupon.present?
            discount = code == "" ? 0 : (coupon.discount / 100) * initial_cost
            order = Current.user.orders.create({:cost => initial_cost - discount, :status => "placed", :discount => discount})
            @shopping_cart.cart_item_mappings.each do |mapping|
                order.order_item_mappings.create({:item_id => mapping.item_id, :quantity => mapping.quantity, :sub_cost => mapping.sub_cost})
            end
            @shopping_cart.cart_item_mappings.destroy_all
            redirect_to home_path, notice: "order placed succesfully"
        else
            redirect_to home_path, alert: 'Invalid Coupon Code'
        end 
    end 
        
    def show_user_orders
        @orders = Current.user.orders
    end

    private 
    def clear_cart_total
        @cart_total = 0
    end
end