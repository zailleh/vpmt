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
  validates_presence_of :first_name, :last_name, :mobile, :email

  has_many :patients
  has_many :appointments
  has_many :notes, :as => :takes_notes, :foreign_key => :parent_id
end
