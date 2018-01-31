class GithubConnection
  attr_reader :token, :username

  def initialize(user)
    @username = user.screen_name
    @token = user.oauth_token
  end

  def github_connection
    Faraday.new(:url => "https://api.github.com",
                :headers => {"Authorization" => "token #{token}"})
  end

  def get_user_info
    response = github_connection.get('/user')
    GithubUser.new(JSON.parse(response.body))
  end

  def get_repos
    response = github_connection.get("/users/#{username}/repos")
    JSON.parse(response.body).map do |repo|
      GithubRepo.new(repo)
    end
  end

  def get_stars
    response = github_connection.get("/users/#{username}/starred")
    JSON.parse(response.body).map do |star|
      GithubRepo.new(star)
    end
  end

  def get_followers
    response = github_connection.get("/user/followers")
    JSON.parse(response.body).map do |user|
      user = JSON.parse(github_connection.get("/users/#{user["login"]}").body)
      GithubUser.new(user)
    end
  end

  def get_following
    response = github_connection.get("/user/following")
    JSON.parse(response.body).map do |user|
      user = JSON.parse(github_connection.get("/users/#{user["login"]}").body)
      GithubUser.new(user)
    end
  end
end
