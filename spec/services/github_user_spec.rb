describe GithubUser do
  it "exists" do
    user_attr = {
      login: "max",
      avatar_url: "avatar_url",
      name: "maxfield",
      bio: "student",
      public_repos: 12,
      public_gists: 1,
      followers: 4,
      following: 3,
      location: "Colorado",
      company: "turing",
      blog: "medium",
      email: "max@gmail.com"
    }

    user = GithubUser.new(user_attr)

    expect(user).to be_a GithubUser
    expect(user.username).to eq("max")
    expect(user.avatar_url).to eq("avatar_url")
    expect(user.full_name).to eq("maxfield")
    expect(user.bio).to eq("student")
    expect(user.public_repos_count).to eq(12)
    expect(user.public_gists_count).to eq(1)
    expect(user.followers_count).to eq(4)
    expect(user.following_count).to eq(3)
    expect(user.location).to eq("Colorado")
    expect(user.company).to eq("turing")
    expect(user.blog).to eq("medium")
    expect(user.email).to eq("max@gmail.com")
  end
end
