class AdminHomeController < ApplicationController
    before_action :require_admin_logged_in!
    def index 
        @orders = Order.all 

    end
end