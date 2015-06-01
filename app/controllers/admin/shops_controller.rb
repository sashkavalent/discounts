class Admin::ShopsController < ApplicationController
  inherit_resources
  belongs_to :chain

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
