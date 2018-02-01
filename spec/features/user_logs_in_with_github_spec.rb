describe "User visits root page" do
  it "clicks login" do
    VCR.use_cassette("features/user_logs_in_with_github") do
      stub_omniauth

      visit "/"

      expect(page.status_code).to eq(200)

      click_link "Login With Github"

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Max Stackhouse")
      expect(page).to have_link("Logout")

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
