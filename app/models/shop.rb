# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  address    :string
#  opening_at :time
#  closing_at :time
#  chain_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_shops_on_chain_id  (chain_id)
#

class Shop < ActiveRecord::Base
  belongs_to :chain
end
