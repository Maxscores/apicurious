class DashboardController < ApplicationController
  def index
    @presenter = DashboardPresenter.new(current_user)
    # memoize inside presenter
    # make methods live in presenter
    @tab = params[:tab]
  end
end
