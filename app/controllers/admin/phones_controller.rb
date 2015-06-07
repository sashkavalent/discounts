class Admin::PhonesController < ApplicationController
  inherit_resources
  belongs_to :car_owner

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
