module DiscountsHelper
  def discounts_actions(resource)
    buttons = []
    buttons << link_to('Edit', edit_resource_path(resource), class: 'btn btn-default btn-sm')
    buttons << link_to('Delete', resource_path(resource), method: :delete, class: 'btn btn-danger btn-sm')
    buttons.join(' ').html_safe
  end
end
