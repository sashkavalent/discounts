# == Schema Information
#
# Table name: cars
#
#  id                  :integer          not null, primary key
#  model               :string
#  registration_number :string
#  car_owner_id        :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Car < ActiveRecord::Base
  belongs_to :car_owner
end
