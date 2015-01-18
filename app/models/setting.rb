# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  fields     :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Setting < ActiveRecord::Base
  store_accessor :fields, :image_density

  validates :image_density, numericality: { greater_than: 0, less_than: 1200,
                                            only_integer: true }
  def self.instance
    first
  end
end
