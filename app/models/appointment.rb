# == Schema Information
#
# Table name: appointments
#
#  id                    :bigint(8)        not null, primary key
#  when                  :datetime
#  reason                :text
#  staff_id              :bigint(8)
#  patient_id            :bigint(8)
#  admission_id          :bigint(8)
#  customer_id           :bigint(8)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  appointment_status_id :bigint(8)
#

class Appointment < ApplicationRecord
  #validations
  validates_presence_of :when
  validates_presence_of :reason

  #associations
  has_one :admission, :required => false
  belongs_to :status, :class_name => 'AppointmentStatus'
  belongs_to :staff
  belongs_to :customer
  belongs_to :patient
  has_many :interventions
  has_many :notes, :as => :takes_notes, :foreign_key => :parent_id
end
