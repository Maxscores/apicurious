describe User do
  context "validations" do
    it "is invalid without uid" do
      user = User.new(screen_name: "Max", oauth_token: "token")

      expect(user).to be_invalid
    end

    it "is invalid without screen name" do
      user = User.new(uid: "12313", oauth_token: "token")

      expect(user).to be_invalid
    end

    it "is invalid without oauth_token" do
      user = User.new(screen_name: "Max", uid: "121354")

      expect(user).to be_invalid
    end

    it "is valid" do
      user = User.new(uid: "12321", screen_name: "Max", oauth_token: "token")

      expect(user).to be_valid
    end
  end

  context "class methods" do
    context "::from_github" do
      it "creates a new user" do
        auth_hash = OpenStruct.new({
          uid: "12346",
          extra: OpenStruct.new({raw_info: OpenStruct.new({login: "Max"})}),
          credentials: OpenStruct.new({token: "token"})
          })

        User.from_github(auth_hash)

        user = User.last

        expect(user.uid).to eq("12346")
        expect(user.screen_name).to eq("Max")
        expect(user.oauth_token).to eq("token")
      end
    end
  end
end
