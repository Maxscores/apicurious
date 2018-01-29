class GithubUser < GithubConnection
  attr_reader :token, :username, :user_info, :repos, :events, :organizations

  def initialize(user)
    @username = user.screen_name
    @token = user.oauth_token
    @user_info = nil
    @repos = nil
    @events = nil
    @organizations = nil
  end

  def get_user_info
    response = github_connection.get do |req|
      req.url '/user'
    end
    @user_info ||= JSON.parse(response.body)
  end

  def get_repos
    response = github_connection.get do |req|
      req.url "/users/#{username}/repos"
    end
    repositories = []
    JSON.parse(response.body).each do |repo|
      repositories << GithubRepo.new(repo)
    end
    @repos ||= repositories
  end

  def get_organizations
    orgs = []
    response = github_connection.get do |req|
      req.url "/users/#{username}/orgs"
    end
    JSON.parse(response.body).each do |org|
      orgs << org["login"]
    end
    @organizations = orgs
  end

  def get_events
    commits = []
    @repos.each do |repo|
      response = github_connection.get do |req|
        req.url "/repos/#{username}/#{repo.name}/commits"
      end
      JSON.parse(response.body).each do |commit|
        commits << GithubCommit.new(commit, repo)
      end
    end
    @events ||= commits
  end

  def get_commits
    response = github_connection.get do |req|
      req.url "/search/commits?q=author:#{username}"
    end
    JSON.parse(response.body)
  end

  def stars
    response = github_connection.get do |req|
      req.url "/users/#{username}/starred"
    end
    JSON.parse(response.body).count
  end

  def avatar_url
    user_info["avatar_url"]
  end

  def full_name
    user_info["name"]
  end

  def bio
    user_info["bio"]
  end

  def public_repos_count
    user_info["public_repos"]
  end

  def public_gists_count
    user_info["public_gists"]
  end

  def followers_count
    user_info["followers"]
  end

  def following_count
    user_info["following"]
  end
end
