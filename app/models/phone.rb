# == Schema Information
#
# Table name: phones
#
#  id           :integer          not null, primary key
#  phone        :string
#  description  :text
#  car_owner_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Phone < ActiveRecord::Base
  belongs_to :car_owner
end
