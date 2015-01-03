class V1::Chains < Grape::API
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
      get :discounts do
        Discount.where(chain_id: params[:id])
      end
    end
  end
end
