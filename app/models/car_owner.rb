# == Schema Information
#
# Table name: car_owners
#
#  id          :integer          not null, primary key
#  name        :string
#  second_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CarOwner < ActiveRecord::Base
  has_many :cars, dependent: :destroy
  has_many :phones, dependent: :destroy
  has_many :emails, dependent: :destroy

  accepts_nested_attributes_for :cars, :phones, :emails, allow_destroy: true
  default_scope { includes(:cars).includes(:phones).includes(:emails) }
end
