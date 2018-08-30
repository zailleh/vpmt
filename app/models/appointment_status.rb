# == Schema Information
#
# Table name: appointment_statuses
#
#  id     :bigint(8)        not null, primary key
#  status :string
#

class AppointmentStatus < ApplicationRecord
  validates_presence_of :status
  
  has_many :appointments, :foreign_key => :status_id
  belongs_to :next_status, :class_name => 'AppointmentStatus', :foreign_key => :next, :optional => true;
  belongs_to :previous_status, :class_name => 'AppointmentStatus', :foreign_key => :prev, :optional => true;
end
