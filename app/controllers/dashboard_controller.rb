class DashboardController < ApplicationController
  def index
    @basic_info = current_user.get_user_info
  end
end
