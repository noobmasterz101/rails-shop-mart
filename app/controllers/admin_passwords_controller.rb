class AdminPasswordsController < ApplicationController
    # allows only logged in admins
    before_action :require_admin_logged_in!
    def edit; end
    def update
      # update admin password
      if Current.admin.update(password_params)
        redirect_to root_path, notice: 'Password Updated'
      else
        render :edit
      end
    end
    private
    def password_params
      params.require(:admin).permit(:password, :password_confirmation)
    end
  end