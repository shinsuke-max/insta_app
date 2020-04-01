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

  # 名がなければ無効な状態であること it "is invalid without a first name"
  # 姓がなければ無効な状態であること it "is invalid without a last name"
  # メールアドレスがなければ無効な状態であること it "is invalid without an email address"
  # 重複したメールアドレスなら無効な状態であること it "is invalid with a duplicate email address"
end
