# == Schema Information
#
# Table name: discounts
#
#  id           :integer          not null, primary key
#  product_name :string
#  price        :integer
#  economy      :float
#  chain_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_discounts_on_chain_id  (chain_id)
#

class Discount < ActiveRecord::Base
  belongs_to :chain
  has_one :image, as: :imageable
  accepts_nested_attributes_for :image
  validates :price, presence: true

  def builded_image
    image || build_image
  end
end
