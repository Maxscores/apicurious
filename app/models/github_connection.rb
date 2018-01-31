class GithubConnection
  attr_reader :token, :username

  def initialize(user)
    @username = user.screen_name
    @token = user.oauth_token
  end

  def github_connection
    Faraday.new(:url => "https://api.github.com", :headers => {"Authorization" => "token #{token}"})
  end

  def get_url(url)
    github_connection.get do |req|
      req.url url
    end
  end

  def get_user_info
    response = get_url('/user')
    GithubUser.new(JSON.parse(response.body))
  end

  def get_repos
    response = get_url("/users/#{username}/repos")
    JSON.parse(response.body).map do |repo|
      GithubRepo.new(repo)
    end
  end

  def get_stars
    response = get_url("/users/#{username}/starred")
    JSON.parse(response.body).map do |star|
      GithubRepo.new(star)
    end
  end

  def get_followers
    response = get_url("/user/followers")
    JSON.parse(response.body).map do |user|
      user = JSON.parse(get_url("/users/#{user["login"]}").body)
      GithubUser.new(user)
    end
  end

  def get_following
    response = get_url("/user/following")
    JSON.parse(response.body).map do |user|
      user = JSON.parse(get_url("/users/#{user["login"]}").body)
      GithubUser.new(user)
    end
  end
end
