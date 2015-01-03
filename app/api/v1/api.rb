class V1::API < Grape::API
  version 'v1', using: :path
  mount V1::Discounts
  mount V1::Chains
end
