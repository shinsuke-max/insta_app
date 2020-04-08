require 'rails_helper'

RSpec.describe "Posts", type: :system do
  scenario "user creates a new post" do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "サインインする"
    visit new_post_path

    expect do
      fill_in "キャプションを書く", with: "testtesttest"
      attach_file "画像を選択", "#{Rails.root}/spec/fixtures/test.png"
      click_button "投稿する"
      expect(page).to have_content "投稿が保存されました"
      expect(page).to have_content "testtesttest"
    end.to change(user.posts, :count).by(1)
  end

  #scenario "user delete a post" do
  #let(:taxonomy) { create(:taxonomy, name: "Categories") }
  #let(:user) { create(:user)}
  #  user = FactoryBot.create(:user)
  #  post = FactoryBot.create(:post, user: user)
  #  photo = FactoryBot.create(:photo, post: post)
  #
  #  visit new_user_session_path
  #  fill_in "メールアドレス", with: user.email
  #  fill_in "パスワード", with: user.password
  #  click_button "サインインする"
  #  visit root_path
  #
  #  expect
  #end
end
