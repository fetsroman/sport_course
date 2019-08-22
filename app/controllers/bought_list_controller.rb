class BoughtListController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = Course.where(id: current_user.bought_courses)
  end
end
