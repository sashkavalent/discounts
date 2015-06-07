class V1::CarOwners < Grape::API
  include Grape::Kaminari

  resources :car_owners do
    desc 'Returns all car owners with cars, emails and phone numbers.'
    paginate
    get do
      Kaminari.paginate_array(CarOwner.all.as_json(include: [:cars, :emails, :phones])).page(params[:page]).per(params[:per_page])
    end
  end
end
