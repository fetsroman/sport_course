class Admin::StatisticsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @courses = Course.all
    @rates = Rate.all
    @bought_lists = BoughtList.all
    @users = User.all
  end
end
