# == Schema Information
#
# Table name: tprs
#
#  id           :bigint(8)        not null, primary key
#  temperature  :float
#  resp_rate    :float
#  pulse        :float
#  admission_id :bigint(8)
#  staff_id     :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Tpr < ApplicationRecord
  validates_presence_of :temperature, :resp_rate, :pulse

  belongs_to :admission
  belongs_to :staff
end
