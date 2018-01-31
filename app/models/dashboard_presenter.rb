class DashboardPresenter
  attr_reader :github_user,
              :repositories,
              :organizations,
              :stars,
              :followers,
              :following,
              :connection,
              :tab

  def initialize(user, tab)
    @connection = GithubConnection.new(user)
    @github_user = @connection.get_user_info
    @repositories = nil
    @stars = @connection.get_stars
    @followers = nil
    @following = nil
    @tab = tab
  end

  def present
    if tab == "repositories"
      @repositories = connection.get_repos
    elsif tab == "stars"
      @stars = connection.get_stars
    elsif tab == "followers"
      @followers = connection.get_followers
    elsif tab == "following"
      @following = connection.get_following
    end
    self
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
