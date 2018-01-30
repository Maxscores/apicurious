class DashboardController < ApplicationController
  def index
    @presenter = DashboardPresenter.new(current_user)
    @tab = params[:tab]
  end
end
