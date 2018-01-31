class DashboardController < ApplicationController
  def index
    @presenter = DashboardPresenter.new(current_user, params[:tab]).present
  end
end
