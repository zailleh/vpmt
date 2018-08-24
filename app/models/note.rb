# == Schema Information
#
# Table name: notes
#
#  id         :bigint(8)        not null, primary key
#  details    :text
#  staff_id   :bigint(8)
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint(8)
#

class Note < ApplicationRecord
  validates_presence_of :details

  belongs_to :staff
  belongs_to :takes_notes, :polymorphic => true, :foreign_key => :parent_id
end
