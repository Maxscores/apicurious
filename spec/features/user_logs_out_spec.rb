describe "Logged in User on dashboard" do
  describe "clicks on logout" do
    it "and is logged out" do
      VCR.use_cassette("features/user_logs_in_with_github") do
        stub_omniauth

        visit "/"
        click_link "Login With Github"

        expect(page).to have_link("Logout")

        click_on "Logout"

        expect(page).to have_link("Login With Github")
      end
    end


  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      {"provider"=>"github",
       "uid"=>"29938166",
       "info"=>
        {"nickname"=>"Maxscores",
         "email"=>"maxstackhouse@gmail.com",
         "name"=>"Max Stackhouse",
         "image"=>"https://avatars1.githubusercontent.com/u/29938166?v=4",
         "urls"=>{"GitHub"=>"https://github.com/Maxscores", "Blog"=>"https://medium.com/@maxstackhouse"}},
       "credentials"=>{"token"=>ENV["GITHUB_USER_TOKEN"], "expires"=>false},
       "extra"=>
        {"raw_info"=>
          {"login"=>"Maxscores",
           "id"=>29938166,
           "avatar_url"=>"https://avatars1.githubusercontent.com/u/29938166?v=4",
           "gravatar_id"=>"",
           "url"=>"https://api.github.com/users/Maxscores",
           "html_url"=>"https://github.com/Maxscores",
           "followers_url"=>"https://api.github.com/users/Maxscores/followers",
           "following_url"=>"https://api.github.com/users/Maxscores/following{/other_user}",
           "gists_url"=>"https://api.github.com/users/Maxscores/gists{/gist_id}",
           "starred_url"=>"https://api.github.com/users/Maxscores/starred{/owner}{/repo}",
           "subscriptions_url"=>"https://api.github.com/users/Maxscores/subscriptions",
           "organizations_url"=>"https://api.github.com/users/Maxscores/orgs",
           "repos_url"=>"https://api.github.com/users/Maxscores/repos",
           "events_url"=>"https://api.github.com/users/Maxscores/events{/privacy}",
           "received_events_url"=>"https://api.github.com/users/Maxscores/received_events",
           "type"=>"User",
           "site_admin"=>false,
           "name"=>"Max Stackhouse",
           "company"=>"@turingschool",
           "blog"=>"https://medium.com/@maxstackhouse",
           "location"=>"Colorado",
           "email"=>"maxstackhouse@gmail.com",
           "hireable"=>true,
           "bio"=>
            "@turingschool - Student(Backend Software Development)\r\n\r\n@ColoradoSchoolofMines - B.S. Metallurgical and Materials Engineering ",
           "public_repos"=>28,
           "public_gists"=>18,
           "followers"=>4,
           "following"=>8,
           "created_at"=>"2017-07-06T03:55:31Z",
           "updated_at"=>"2018-01-30T18:50:07Z"},
         "all_emails"=>[]}})
       end
  end
end
