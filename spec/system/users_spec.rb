require 'rails_helper'

RSpec.describe "Users", type: :system do
  scenario "creates a new user" do
    visit new_user_registration_path
    fill_in "メールアドレス", with: "test@insta.com"
    fill_in "フルネーム", with: "hogehoge"
    fill_in "パスワード", with: "password"
    fill_in "パスワードの確認", with: "password"
    click_button "登録する"
    expect(page).to have_content "アカウント登録が完了しました。"
  end
end
