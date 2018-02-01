describe DashboardPresenter do
  let(:user) {User.create!(uid: "1235464",
                           screen_name: "Maxscores",
                           oauth_token: ENV["GITHUB_USER_TOKEN"])}

  let(:presenter) {DashboardPresenter.new(user, "tab")}

  it "exists" do
    VCR.use_cassette("presenters/it_exists") do
      expect(presenter).to be_a DashboardPresenter
      expect(presenter.connection).to be_a GithubConnection
      expect(presenter.tab).to eq("tab")
    end
  end

  context "instance methonds" do
    context "#github_user" do
      it "returns the current github user" do
        VCR.use_cassette("prsenters/github_user") do
          expect(presenter.github_user).to be_a GithubUser
        end
      end
    end

    
  end
end
