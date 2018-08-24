# == Schema Information
#
# Table name: shifts
#
#  id         :bigint(8)        not null, primary key
#  start      :datetime
#  end        :datetime
#  role_id    :bigint(8)
#  staff_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shift < ApplicationRecord
end
