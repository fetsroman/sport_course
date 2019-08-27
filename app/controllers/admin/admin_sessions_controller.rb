module Admin
  class AdminSessionsController < ApplicationController

    def new
    end

    def create
      @admin_user = AdminUser.find_by_email(params[:session][:email])
      if @admin_user && @admin_user.authenticate(params[:session][:password])
        session[:admin_user_id] = @admin_user.id
        redirect_to '/admin'
      else
        render :new
      end
    end

  end
end