class Admin::StatisticsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @courses = Course.all
  end
end
