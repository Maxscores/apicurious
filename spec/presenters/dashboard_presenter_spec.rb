describe DashboardPresenter do
  let(:user) {User.create!(uid: "1235464",
                           screen_name: "Maxscores",
                           oauth_token: ENV["GITHUB_USER_TOKEN"])}

  it "exists" do
    VCR.use_cassette("presenters/it_exists") do
      presenter = DashboardPresenter.new(user, "tab")

      expect(presenter).to be_a DashboardPresenter
      expect(presenter.connection).to be_a GithubConnection
      expect(presenter.tab).to eq("tab")
    end
  end
end
