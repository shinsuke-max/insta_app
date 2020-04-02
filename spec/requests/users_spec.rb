require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "get sign_in" do
    it "responds successfully" do
      get new_user_session_path
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end

  describe "user edit" do
    it "responds successfully" do
      user = FactoryBot.create(:user)
      login_as(user)
      get edit_user_registration_path(user)
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end
end
