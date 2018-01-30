class GithubConnection
  attr_reader :token, :username

  def initialize(user)
    @username = user.screen_name
    @token = user.oauth_token
  end

  def github_connection
    Faraday.new(:url => "https://api.github.com", :headers => {"Authorization" => "token #{token}"})
  end

  def get_user_info
    response = github_connection.get do |req|
      req.url '/user'
    end
    GithubUser.new(JSON.parse(response.body))
  end

  def get_repos
    response = github_connection.get do |req|
      req.url "/users/#{username}/repos"
    end
    JSON.parse(response.body).map do |repo|
      GithubRepo.new(repo)
    end
  end

  def get_organizations
    response = github_connection.get do |req|
      req.url "/users/#{username}/orgs"
    end
    JSON.parse(response.body).map do |org|
      org["login"]
    end
  end

  def get_stars
    response = github_connection.get do |req|
      req.url "/users/#{username}/starred"
    end
    JSON.parse(response.body).map do |star|
      GithubRepo.new(star)
    end
  end
end
