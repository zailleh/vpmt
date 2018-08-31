# == Schema Information
#
# Table name: customers
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  street     :string
#  suburb     :string
#  post_code  :string
#  phone      :string
#  mobile     :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
  before_validation :strip_phones
  validates_presence_of :first_name, :last_name, :mobile, :email
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "Must be in the format of 'letters@letters.somthing'" }
  
  validates :mobile, format: { with: /\d{10}/, message: "must be 10 digits long"}
  validates :phone, format: { with: /\d{10}/, message: "must be 10 digits long"}

  
  has_many :patients
  has_many :appointments
  has_many :notes, :as => :takes_notes, :foreign_key => :parent_id

  private
    def strip_phones
      self.phone = self.phone.gsub(/[^\d]/, '')
      self.mobile = self.mobile.gsub(/[^\d]/, '')
    end
end
