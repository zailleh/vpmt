# == Schema Information
#
# Table name: staffs
#
#  id              :bigint(8)        not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  password_digest :text
#  photo_url       :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Staff < ApplicationRecord
end
