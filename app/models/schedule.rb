# == Schema Information
#
# Table name: schedules
#
#  id           :bigint(8)        not null, primary key
#  start        :datetime
#  staff_id     :bigint(8)
#  admission_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Schedule < ApplicationRecord
end
