class BoughtListController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = current_user.bought_courses
  end
end
