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
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email

  has_many :shifts
  has_many :interventions
  has_many :appointments
  has_many :tprs

  def full_name 
    self.first_name + ' ' + self.last_name
  end
end
