describe "Github Authenticated User visits dashboard" do
  it "sees their github profile info" do
    VCR.use_cassette("features/user_sees_their_github_info") do
        user = User.create!(uid: "1235464",
                           screen_name: "Maxscores",
                           oauth_token: ENV["GITHUB_USER_TOKEN"])
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit("/dashboard")

        expect(page).to have_content("Max Stackhouse")
        expect(page).to have_content("Maxscores")
        expect(page).to have_content("@turingschool - Student")
        expect(page).to have_content("@turingschool")
        expect(page).to have_content("Colorado")
        expect(page).to have_link("maxstackhouse@gmail.com")
        expect(page).to have_link("https://medium.com/@maxstackhouse")
    end
  end
end
