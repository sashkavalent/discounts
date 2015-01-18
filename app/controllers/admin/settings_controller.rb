class Admin::SettingsController < ApplicationController
  inherit_resources

  def update
    update! { admin_root_path }
  end

  private

  def permitted_params
    params.permit!
  end
end
