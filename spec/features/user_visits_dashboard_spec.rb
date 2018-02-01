describe "User visits dashboard" do
  let(:user) {User.new(uid: "1235464",
                       screen_name: "Maxscores",
                       oauth_token: ENV["GITHUB_USER_TOKEN"])}

  it "sees their github profile info" do
    VCR.use_cassette("features/user_sees_their_github_info") do
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

  describe "and clicks on repositories tab" do
    it "sees a list of repositories" do
      VCR.use_cassette("features/user_sees_repositories") do
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

  describe "and clicks on stars tab" do
    it "sees a list of starred repositories" do
      VCR.use_cassette("features/user_sees_starred_repositories") do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit "/dashboard"

        click_on "Stars"

        within (".selected") do
          expect(page).to have_content("Stars")
        end
        expect(page).to have_css(".repo", count: 10)
        within first(".repo") do
          expect(page).to have_link("Pain-Caver")
          expect(page).to have_content("Strava Workout Comparisons in Rails")
          expect(page).to have_content("Updated"  )
        end
      end
    end
  end

  describe "and clicks on followers tab" do
    it "sees a list of their followers" do
      VCR.use_cassette("features/user_sees_followers") do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        click_on "Followers"

        within (".selected") do
          expect(page).to have_content("Followers")
        end
        expect(page).to have_css(".user", count: 5)
        within first(".user") do
          expect(page).to have_content("Luis Senior")
          expect(page).to have_content("Heybluguy")
          expect(page).to have_css(".places")
          expect(page).to have_content("Denver")
        end
      end
    end
  end

  describe "and clicks on followering tab" do
    it "sees a list of users they're following" do
      VCR.use_cassette("features/user_sees_following") do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        click_on "Following"

        within (".selected") do
          expect(page).to have_content("Following")
        end
        expect(page).to have_css(".user", count: 8)
        within first(".user") do
          expect(page).to have_content("Josh Mejia")
          expect(page).to have_content("jmejia")
          expect(page).to have_css(".places")
          expect(page).to have_content("Denver")
          expect(page).to have_content("Turing")
        end
      end
    end
  end
end
