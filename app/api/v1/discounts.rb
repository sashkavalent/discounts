class V1::Discounts < Grape::API
  include Grape::Kaminari

  resource :discounts do
    desc 'Returns all discounts.'
    paginate
    get do
      paginate Discount.all.order('created_at DESC')
    end
  end
end
