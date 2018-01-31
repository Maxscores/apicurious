class GithubCommit
  attr_reader :user, :message, :repo

  def initialize(commit, repo)
    @user = commit["commit"]["author"]["name"]
    @message = commit["commit"]["message"]
    @repo = repo.name
  end

end
