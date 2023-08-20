require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(username: "example", email: "user@example.com")
    expect(user).to be_valid
  end

  it "is not valid without a username" do
    user = User.new(email: "user@example.com")
    expect(user).to_not be_valid
  end
end
