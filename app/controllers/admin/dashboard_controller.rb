class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_LOGIN"], password: ENV["ADMIN_PWD"]

  def show
  end
end
