class GithubConnection
  attr_reader :token, :username

  def initialize(user)
    @username = user.screen_name
    @token = user.oauth_token
  end

  def authorized
    Faraday.new(:url => "https://api.github.com",
                :headers => {"Authorization" => "token #{token}"})
  end

  def parse_json(response_body)
    JSON.parse(response_body, symbolize_names: true)
  end

  def get_authorized_user_info
    response = authorized.get('/user')
    GithubUser.new(parse_json(response.body))
  end

  def get_user_info(login_name)
    user = parse_json(authorized.get("/users/#{login_name}").body)
    GithubUser.new(user)
  end

  def get_authorized_repos
    response = authorized.get("/users/#{username}/repos")
    parse_json(response.body).map do |repo|
      GithubRepo.new(repo)
    end
  end

  def get_authorized_stars
    response = authorized.get("/users/#{username}/starred")
    parse_json(response.body).map do |star|
      GithubRepo.new(star)
    end
  end

  def get_authorized_followers
    response = authorized.get("/user/followers")
    parse_json(response.body).map do |user|
      get_user_info(user[:login])
    end
  end

  def get_authorized_following
    response = authorized.get("/user/following")
    parse_json(response.body).map do |user|
      get_user_info(user[:login])
    end
  end
end
