# == Schema Information
#
# Table name: admit_types
#
#  id         :bigint(8)        not null, primary key
#  type_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AdmitType < ApplicationRecord
  has_many :admissions
end
