class Admin::ChainsController < ApplicationController
  inherit_resources

  def create
    create! { collection_path }
  end

  def update
    update! { collection_path }
  end

  private

  def permitted_params
    params.permit!
  end
end
