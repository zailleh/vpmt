# == Schema Information
#
# Table name: admissions
#
#  id             :bigint(8)        not null, primary key
#  reason         :text
#  staff_id       :bigint(8)
#  patient_id     :bigint(8)
#  appointment_id :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Admission < ApplicationRecord
  # validations
  validates_presence_of :reason

  # associations
  belongs_to :patient
  belongs_to :staff
  belongs_to :appointment, :optional => true
  has_many :tprs
  has_many :interventions
  has_many :schedules
  has_many :notes, :as => :takes_notes, :foreign_key => :parent_id
end
