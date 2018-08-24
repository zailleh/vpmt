# == Schema Information
#
# Table name: roles
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ApplicationRecord
  validates_presence_of :name
  
  has_many :shifts
end
