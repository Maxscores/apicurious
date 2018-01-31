describe "User visits dashboard" do
  describe "and clicks on repositories tab" do
    it "sees a list of repositories" do
      VCR.use_cassette("features/user_sees_repositories") do
        user = User.create!(uid: "1235464",
                           screen_name: "Maxscores",
                           oauth_token: ENV["GITHUB_USER_TOKEN"])
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit "/dashboard"

        click_on "Repositories"

        within (".selected") do
          expect(page).to have_content("Repositories")
        end
        expect(page).to have_css(".repo", count: 28)
        within first(".repo") do
          expect(page).to have_link("100-days-of-code")
          expect(page).to have_content("Fork this template")
          expect(page).to have_content("Updated")
        end
      end
    end
  end
end
