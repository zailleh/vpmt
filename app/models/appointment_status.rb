# == Schema Information
#
# Table name: appointment_statuses
#
#  id     :bigint(8)        not null, primary key
#  status :string
#

class AppointmentStatus < ApplicationRecord
  validates_presence_of :status
  
  has_many :appointments
end
