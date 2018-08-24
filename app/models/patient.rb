# == Schema Information
#
# Table name: patients
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  date_of_birth :date
#  breed         :string
#  animal_type   :string
#  customer_id   :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Patient < ApplicationRecord
end
