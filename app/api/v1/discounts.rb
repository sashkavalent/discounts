class V1::Discounts < Grape::API
  resource :discounts do
    desc 'Returns all discounts.'
    get do
      Discount.all
    end
  end
end
