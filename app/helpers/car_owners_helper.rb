module CarOwnersHelper
  def car_owner_actions(resource)
    buttons = []
    buttons << link_to('Edit', edit_resource_path(resource), class: 'btn btn-default btn-sm')
    buttons << link_to('Delete', resource_path(resource), method: :delete, class: 'btn btn-danger btn-sm')
    buttons << link_to('Cars', admin_car_owner_cars_path(resource), class: 'btn btn-default btn-sm')
    buttons << link_to('Emails', admin_car_owner_emails_path(resource), class: 'btn btn-default btn-sm')
    buttons << link_to('Phones', admin_car_owner_phones_path(resource), class: 'btn btn-default btn-sm')
    buttons.join(' ').html_safe
  end
end
