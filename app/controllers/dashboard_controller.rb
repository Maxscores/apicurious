class DashboardController < ApplicationController
  def index
    @user = GithubUser.new(current_user)
    @basic_info = @user.get_user_info
    @repos = @user.get_repos
    @events = @user.get_commits
    @organizations = @user.get_organizations
    @stars = @user.stars
  end
end
