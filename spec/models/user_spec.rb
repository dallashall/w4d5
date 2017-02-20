require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:subs) }
  it { should have_many(:posts) }

  describe "User methods" do
    before(:each) { @user = User.create(username: 'Dallas', password: '123456') }

    it "finds a user by their username and password" do
      user1 = User.first
      expect(user1.is_password?('123456')).to be_truthy
      expect(user1.is_password?('12345')).to be_falsey
    end

    it "resets session_token" do
      token_before = User.first.session_token
      token_after = User.first.reset_session_token!

      expect(token_before).to_not eq(token_after)
    end
  end
end
