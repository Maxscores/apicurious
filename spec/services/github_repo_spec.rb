describe GithubRepo do
  let(:repo_attr) {{
    name: "repo",
    owner: "owner",
    full_name: "full_name",
    description: "description",
    private: false,
    fork: false,
    url: "api_url",
    http_url: "http_url",
    language: "ruby",
    updated_at: Date.new
    }}

  it "exists" do
    repo = GithubRepo.new(repo_attr)

    expect(repo).to be_a GithubRepo
    expect(repo.name).to eq("repo")
    expect(repo.owner).to eq("owner")
    expect(repo.full_name).to eq("full_name")
    expect(repo.description).to eq("description")
    expect(repo.private).to be_falsy
    expect(repo.fork).to be_falsy
    expect(repo.api_url).to eq("api_url")
    expect(repo.http_url).to eq("http_url")
    expect(repo.language).to eq("ruby")
    expect(repo.updated_at).to be_a Date

  end
end
