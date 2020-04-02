require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is valid with name, email, and password" do
    user = User.new(
      name: "sato",
      email: "tt@example.com",
      password: "password",
    )
    expect(user).to be_valid
  end

  # 名がなければ無効な状態であること
  it "is invalid without name" do
    user = User.new(name: nil)
    user.valid?
    expect(user).to_not be_valid
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user).to_not be_valid
  end
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      name: "tt",
      email: "hoge@example.com",
      password: "password",
    )
    user = User.new(
      name: "ts",
      email: "hoge@example.com",
      password: "password",
    )
    user.valid?
    expect(user).to_not be_valid
  end
end
