class Admin::ChainsController < ApplicationController
  inherit_resources

  def update_sheet
    resource.update_sheet
    redirect_to admin_chain_sheets_path(resource)
  end

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
