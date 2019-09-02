class WelcomeController < ApplicationController
  def index
    @courses = Course.where(published: true)
  end
end
