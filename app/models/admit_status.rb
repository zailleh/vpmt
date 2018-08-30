# == Schema Information
#
# Table name: admit_statuses
#
#  id     :bigint(8)        not null, primary key
#  prev   :bigint(8)
#  status :string
#  next   :bigint(8)
#

class AdmitStatus < ApplicationRecord
  validates_presence_of :status
  
  has_many :admissions, :foreign_key => :status_id
  belongs_to :next_status, :class_name => 'AdmitStatus', :foreign_key => :next, :optional => true;
  belongs_to :previous_status, :class_name => 'AdmitStatus', :foreign_key => :prev, :optional => true;
end
