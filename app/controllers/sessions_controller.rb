class SessionsController < ApplicationController
    # before_action :set_current_user, :current_shopping_cart, only: [:add_to_cart]
    def new; end
    def create
      # byebug
      user = User.find_by(email: params[:email])
      # finds existing user, checks to see if user can be authenticated
      if user.present? && user.authenticate(params[:password])
      # sets up user.id sessions
        session[:user_id] = user.id
        session[:admin_id] = nil

        if params[:id]
          Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
          @shopping_cart = Current.user.shopping_cart
          @cart_total = 0
          add_to_cart
        else
          redirect_to home_url, notice: 'Logged in successfully'
        end
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
    def destroy
      # deletes user session
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end

    def add_to_cart 
      p params
      id = params[:id].to_i
      item = Item.find(id)
      q = params[:quantity].to_i
      # byebug
      if CartItemMapping.exists?(:item_id => id, :shopping_cart_id => @shopping_cart.id) == false
          new_item = @shopping_cart.cart_item_mappings.create({:item_id => id, :item_name => item.name, :quantity => q, :sub_cost => q * item.price})
      end
      redirect_to home_path
    end 
  end