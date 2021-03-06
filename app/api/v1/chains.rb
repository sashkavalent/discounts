class V1::Chains < Grape::API
  include Grape::Kaminari

  resources :chains do
    desc 'Returns all chains.'
    get do
      Chain.all
    end

    route_param :id do
      desc 'Returns discounts of chain with id passed in params.'
      params do
        requires :id, type: Integer, desc: 'Chain id'
      end
      paginate
      get :discounts do
        paginate Discount.where(chain_id: params[:id]).includes(:image)
      end

      desc 'Returns shops of chain with id passed in params.'
      params do
        requires :id, type: Integer, desc: 'Chain id'
      end
      paginate
      get :shops do
        paginate Shop.where(chain_id: params[:id])
      end
    end
  end
end
