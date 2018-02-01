describe GithubConnection do
  let(:user) {User.new(uid: "1235464",
                       screen_name: "Maxscores",
                       oauth_token: ENV["GITHUB_USER_TOKEN"])}

  let(:github_connection) {GithubConnection.new(user)}

  it "exists" do
    expect(github_connection.username).to eq("Maxscores")
    expect(github_connection.token).to eq(ENV["GITHUB_USER_TOKEN"])
  end

  describe "instance methods" do
    context "#authorized" do
      it "is a faraday object with url & headers" do
        authorized_connection = github_connection.authorized

        expect(authorized_connection).to be_a Faraday::Connection
        expect(authorized_connection.headers).to have_key "Authorization"
        expect(authorized_connection.headers["Authorization"]).to eq("token #{github_connection.token}")
      end
    end

    context "#get_authorized_user_info" do
      it "returns an authorized users profile info" do
        VCR.use_cassette("services/github_connection_authorized_user_info") do
          user_info = github_connection.get_authorized_user_info

          expect(user_info).to be_a GithubUser
        end
      end
    end

    context "#get_authorized_repos" do
      it "returns an authorized users repos" do
        VCR.use_cassette("services/github_connection_authorized_repos") do
          repos = github_connection.get_authorized_repos

          expect(repos.count).to eq(28)
          expect(repos).to all(be_a GithubRepo)
        end
      end
    end

    context "#get_user_info(login_name)" do
      it "returns a user profile by searching by login name" do
        VCR.use_cassette("services/github_connection_user_info") do
          user = github_connection.get_user_info("Maxscores")

          expect(user).to be_a GithubUser
          expect(user.username).to eq("Maxscores")
        end
      end
    end

    context "#get_authorized_stars" do
      it "returns an authorized users starred repos" do
        VCR.use_cassette("services/github_connection_starred") do
          starred_repos = github_connection.get_authorized_stars

          expect(starred_repos.count).to eq(10)
          expect(starred_repos).to all(be_a GithubRepo)
        end
      end
    end

    context "#get_authorized_followers" do
      it "returns an authorized users followers" do
        VCR.use_cassette("services/github_connection_followers") do
          followers = github_connection.get_authorized_followers

          expect(followers.count).to eq(5)
          expect(followers).to all(be_a GithubUser)
        end
      end
    end

    context "#get_authorized_following" do
      it "returns an authorized users following" do
        VCR.use_cassette("services/github_connection_following") do
          following = github_connection.get_authorized_following

          expect(following.count).to eq(8)
          expect(following).to all(be_a GithubUser)
        end
      end
    end
  end
end
