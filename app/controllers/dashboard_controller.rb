class DashboardController < ApplicationController
  def index
    @user = GithubUser.new(current_user)
    @basic_info = @user.get_user_info
    @repos = @user.get_repos
  end
end
