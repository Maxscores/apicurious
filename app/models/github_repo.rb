class GithubRepo
  attr_reader :name, :owner, :full_name, :description, :private, :fork, :api_url, :http_url

  def initialize(repo)
    @name = repo["name"]
    @owner = repo["owner"]
    @full_name = repo["full_name"]
    @description = repo["description"]
    @private = repo["private"]
    @fork = repo["fork"]
    @api_url = repo["url"]
    @http_url = repo["http_url"]
  end
end
