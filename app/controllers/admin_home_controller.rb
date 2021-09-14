class AdminHomeController < ApplicationController
    def index 
        @orders = Order.all 

    end
end