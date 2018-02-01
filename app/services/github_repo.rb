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

  def initialize(repo_attr)
    @name = repo_attr[:name]
    @owner = repo_attr[:owner]
    @full_name = repo_attr[:full_name]
    @description = repo_attr[:description]
    @private = repo_attr[:private]
    @fork = repo_attr[:fork]
    @api_url = repo_attr[:url]
    @http_url = repo_attr[:http_url]
    @language = repo_attr[:language]
    @updated_at = repo_attr[:updated_at]
  end
end
