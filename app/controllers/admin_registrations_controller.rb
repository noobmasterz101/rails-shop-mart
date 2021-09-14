class AdminRegistrationsController < ApplicationController
    # instantiates new admin
    def new
      @admin = Admin.new
    end
    def create
      @admin = Admin.new(admin_params)
      if @admin.save
      # stores saved admin id in a session
        session[:admin_id] = @admin.id
        redirect_to ad_home_url, notice: 'Successfully created admin account'
      else
        render :new
      end
    end
    private
    def admin_params
      # strong parameters
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end
  end