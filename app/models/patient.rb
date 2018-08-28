# == Schema Information
#
# Table name: patients
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  date_of_birth :date
#  breed         :string
#  animal_type   :string
#  customer_id   :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  img_url       :text
#

class Patient < ApplicationRecord
  validates_presence_of :name, :date_of_birth, :breed, :animal_type

  has_many :admissions
  has_many :appointments
  belongs_to :customer
  has_many :notes, :as => :takes_notes, :foreign_key => :parent_id
end
