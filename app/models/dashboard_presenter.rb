class DashboardPresenter
  attr_reader :github_user,
              :repositories,
              :organizations,
              :stars,
              :followers,
              :following

  def initialize(user)
    @connection = GithubConnection.new(user)
    @github_user ||= @connection.get_user_info
    @repositories ||= @connection.get_repos
    @organizations ||= @connection.get_organizations
    @stars ||= @connection.get_stars
    @followers ||= nil
    @following ||= nil
  end

  def avatar_url
    github_user.avatar_url
  end

  def full_name
    github_user.full_name
  end

  def bio
    github_user.bio
  end

  def location
    github_user.location
  end

  def email
    github_user.email
  end

  def company
    github_user.company
  end

  def blog
    github_user.blog
  end
end
