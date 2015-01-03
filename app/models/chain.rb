# == Schema Information
#
# Table name: chains
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chain < ActiveRecord::Base
  has_one :logo, as: :imageable, class_name: 'Image'
  has_many :discounts
  validates :name, presence: true
  accepts_nested_attributes_for :logo

  def builded_logo
    logo || build_logo
  end
end
