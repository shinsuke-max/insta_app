require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user, name: "sato", email: "papapa@example.com", password: "password") }
  scenario "user creates a new post" do
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
end
