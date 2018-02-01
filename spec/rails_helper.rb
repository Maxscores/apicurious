require 'simplecov'
SimpleCov.start 'rails'
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data("<github_user_token>") { "token #{ENV["GITHUB_USER_TOKEN"]}"}
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
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
