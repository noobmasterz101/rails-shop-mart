class ApplicationController < ActionController::Base
    before_action :set_current_user, :current_shopping_cart
    def set_current_user
      # finds user with session data and stores it if present
      Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
    def require_user_logged_in!
      # allows only logged in user
      redirect_to sign_in_path, alert: 'You must be signed in as a user' if Current.user.nil?
    end    
    def require_admin_logged_in!
    # allows only logged in admin
    redirect_to ad_sign_in_path, alert: 'You must be signed in as an admin' if Current.admin.nil?
  end 
    def current_shopping_cart
      if login?
        @shopping_cart = Current.user.shopping_cart
        @cart_total = 0
      end
    end   
    def login?
      !!Current.user
    end
    def authenticated?
      redirect to sign_in_path unless login?
    end
    # for admin
    before_action :set_current_admin 
    def set_current_admin 
      Current.admin = Admin.find_by(id: session[:admin_id]) if session[:admin_id]
    end
    def require_admin_logged_in!
      redirect_to ad_sign_in_path, alert: 'You must be signed in as admin' if Current.admin.nil?
    end
  end