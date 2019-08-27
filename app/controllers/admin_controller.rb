class AdminController < ApplicationController
  # before_action :user_admin?

  def index
    @course = Course.all
  end

  private

  # def user_admin?
  #   if current_user.admin?
  #     true
  #   else
  #     redirect_to root_path
  #   end
  # end
end
