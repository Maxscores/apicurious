class GithubUser < GithubConnection
  attr_reader :avatar_url,
              :full_name,
              :bio,
              :public_repos_count,
              :public_gists_count,
              :followers_count,
              :following_count,
              :location
              
  def initialize(user_info)
    @avatar_url = user_info["avatar_url"]
    @full_name = user_info["name"]
    @bio = user_info["bio"]
    @public_repos_count = user_info["public_repos"]
    @public_gists_count = user_info["public_gists"]
    @followers_count = user_info["followers"]
    @following_count = user_info["following"]
    @location = user_info["location"]
  end
end
