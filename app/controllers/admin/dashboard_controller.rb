class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV['MY_USER'], :password => ENV['MY_PASS']
  def show
  end
end
