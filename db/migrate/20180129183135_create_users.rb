class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :screen_name
      t.string :uid
      t.string :oauth_token
      t.string :avatar_url

      t.timestamps
    end
  end
end
