class DashboardController < ApplicationController
  def index
    @user = GithubConnection.new(current_user)
    @github_user = @user.get_user_info
    @repos = @user.get_repos
    @organizations = @user.get_organizations
    @stars = @user.get_stars
    @followers
    @following
  end
end
