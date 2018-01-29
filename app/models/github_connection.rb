class GithubConnection
  def github_connection
    Faraday.new(:url => "https://api.github.com", :headers => {"Authorization" => "token #{token}"})
  end
end
