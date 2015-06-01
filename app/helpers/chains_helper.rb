module ChainsHelper
  def chain_actions(resource)
    buttons = []
    buttons << link_to('Edit', edit_resource_path(resource), class: 'btn btn-default btn-sm')
    buttons << link_to('Delete', resource_path(resource), method: :delete, class: 'btn btn-danger btn-sm')
    buttons << link_to('Discounts', admin_chain_discounts_path(resource), class: 'btn btn-default btn-sm')
    buttons << link_to('Shops', admin_chain_shops_path(resource), class: 'btn btn-default btn-sm')
    buttons << link_to('Sheets', admin_chain_sheets_path(resource), class: 'btn btn-default btn-sm')
    buttons << link_to('Update sheet', update_sheet_admin_chain_path(resource), method: :post, class: 'btn btn-default btn-sm')
    buttons.join(' ').html_safe
  end
end
