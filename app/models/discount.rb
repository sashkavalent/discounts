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
#  sheet_id     :integer
#  active_from  :datetime
#  active_till  :datetime
#
# Indexes
#
#  index_discounts_on_active_till_and_active_from  (active_till,active_from)
#  index_discounts_on_chain_id                     (chain_id)
#  index_discounts_on_sheet_id                     (sheet_id)
#

class Discount < ActiveRecord::Base
  belongs_to :chain
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image

  def serializable_hash(*args)
    super(*args).merge(original_image: image.attachment.url,
                       thumb_image: image.attachment.url(:thumb))
  end

  def builded_image
    image || build_image
  end
end
