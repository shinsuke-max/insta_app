# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected
  before_action :forbid_test_user, {only: [:edit,:update,:destroy]}

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

  private
    def forbid_test_user
      if @user.email == "test@insta.org"
        flash[:notice] = "テストユーザーのため変更できません"
        redirect_to root_path
      end
    end
end
