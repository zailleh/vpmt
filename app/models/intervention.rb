# == Schema Information
#
# Table name: interventions
#
#  id             :bigint(8)        not null, primary key
#  description    :text
#  admission_id   :bigint(8)
#  appointment_id :bigint(8)
#  staff_id       :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Intervention < ApplicationRecord
  belongs_to :admission
end
