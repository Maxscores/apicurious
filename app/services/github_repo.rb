class GithubRepo
  attr_reader :name,
              :owner,
              :full_name,
              :description,
              :private,
              :fork,
              :api_url,
              :http_url,
              :language,
              :updated_at

  def initialize(repo)
    @name = repo[:name]
    @owner = repo[:owner]
    @full_name = repo[:full_name]
    @description = repo[:description]
    @private = repo[:private]
    @fork = repo[:fork]
    @api_url = repo[:url]
    @http_url = repo[:http_url]
    @language = repo[:language]
    @updated_at = repo[:updated_at]
  end
end
