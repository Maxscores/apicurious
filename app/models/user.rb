class User < ApplicationRecord
  def self.from_github(auth_hash)
    where(uid: auth_hash[:uid]).first_or_create do |new_user|
      new_user.uid = auth_hash.uid
      new_user.screen_name = auth_hash.extra.raw_info.login
      new_user.oauth_token = auth_hash.credentials.token
    end
  end

  
end
