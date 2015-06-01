class V1::Shops < Grape::API
  include Grape::Kaminari

  resource :shops do
    desc 'Returns all shops.'
    paginate
    get do
      paginate Shop.all.order('created_at DESC')
    end
  end
end
