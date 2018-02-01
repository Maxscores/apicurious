describe DashboardPresenter do
  let(:user) {User.new(uid: "1235464",
                       screen_name: "Maxscores",
                       oauth_token: ENV["GITHUB_USER_TOKEN"])}

  let(:presenter) {DashboardPresenter.new(user, "tab")}

  it "exists" do
    VCR.use_cassette("presenters/it_exists") do
      expect(presenter).to be_a DashboardPresenter
      expect(presenter.connection).to be_a GithubConnection
      expect(presenter.tab).to eq("tab")
      expect(presenter.github_user).to be_a GithubUser
    end
  end

  context "instance methonds" do
    context "#stars" do
      it "returns a users starred repositories" do
        VCR.use_cassette("presenters/stars") do
          expect(presenter.stars.count).to eq(10)
          expect(presenter.stars.first).to be_a GithubRepo
        end
      end
    end

    context "#repositories" do
      it "returns a users repositories" do
        VCR.use_cassette("presenters/repos") do
          expect(presenter.repositories.count).to eq(28)
          expect(presenter.repositories.first).to be_a GithubRepo
        end
      end
    end

    context "#followers" do
      it "returns current users followers" do
        VCR.use_cassette("presenters/followers") do
          expect(presenter.followers.count).to eq(5)
          expect(presenter.followers.first).to be_a GithubUser
        end
      end
    end

    context "#following" do
      it "returns users who the current user follows" do
        VCR.use_cassette("presenters/following") do
          expect(presenter.following.count).to eq(8)
          expect(presenter.following.first).to be_a GithubUser
        end
      end
    end

    context "#avatar_url" do
      it "returns a users avatar URL" do
        VCR.use_cassette("presenter/it_exists") do
          expected = "https://avatars1.githubusercontent.com/u/29938166?v=4"
          expect(presenter.avatar_url).to eq(expected)
        end
      end
    end

    context "#full_name" do
      it "returns a users full name" do
        VCR.use_cassette("presenter/it_exists") do
          expected = "Max Stackhouse"
          expect(presenter.full_name).to eq(expected)
        end
      end
    end

    context "#bio" do
      it "returns a users bio" do
        VCR.use_cassette("presenter/it_exists") do
          expected = "@turingschool - Student(Backend Software Development)\r\n\r\n@ColoradoSchoolofMines - B.S. Metallurgical and Materials Engineering "
          expect(presenter.bio).to eq(expected)
        end
      end
    end

    context "#location" do
      it "returns a users location" do
        VCR.use_cassette("presenter/it_exists") do
          expect(presenter.location).to eq("Colorado")
        end
      end
    end

    context "#email" do
      it "returns a users email" do
        VCR.use_cassette("presenter/it_exists") do
          expect(presenter.email).to eq("maxstackhouse@gmail.com")
        end
      end
    end

    context "#company" do
      it "returns a users company" do
        VCR.use_cassette("presenter/it_exists") do
          expect(presenter.company).to eq("@turingschool")
        end
      end
    end

    context "#blog" do
      it "returns a users blog" do
        VCR.use_cassette("presenter/it_exists") do
          expect(presenter.blog).to eq("https://medium.com/@maxstackhouse")
        end
      end
    end

    context "#followers_count" do
      it "returns a users followers_count" do
        VCR.use_cassette("presenter/it_exists") do
          expect(presenter.followers_count).to eq(5)
        end
      end
    end

    context "#following_count" do
      it "returns a users following_count" do
        VCR.use_cassette("presenter/it_exists") do
          expect(presenter.following_count).to eq(8)
        end
      end
    end

    context "#repository_count" do
      it "returns a users repository_count" do
        VCR.use_cassette("presenter/it_exists") do
          expect(presenter.repository_count).to eq(28)
        end
      end
    end
  end
end
