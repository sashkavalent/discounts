# == Schema Information
#
# Table name: emails
#
#  id           :integer          not null, primary key
#  email        :string
#  description  :text
#  car_owner_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Email < ActiveRecord::Base
  belongs_to :car_owner
end
