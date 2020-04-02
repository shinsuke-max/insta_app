require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "get root_path" do
    before do
      @user = FactoryBot.create(:user)
    end
    it "responds successfully" do
      login_as(@user)
      get root_path
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end
end
