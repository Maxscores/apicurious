class DashboardPresenter
  attr_reader :connection,
              :tab,
              :github_user,
              :stars

  def initialize(user, tab)
    @connection ||= GithubConnection.new(user)
    @tab = tab
    @github_user ||= @connection.get_user_info
    @stars ||= connection.get_stars
  end

  def repositories
    connection.get_repos
  end

  def followers
    connection.get_followers
  end

  def following
    connection.get_following
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

  def followers_count
    github_user.followers_count
  end

  def following_count
    github_user.following_count
  end

  def repository_count
    github_user.public_repos_count
  end
end
