# == Schema Information
#
# Table name: notes
#
#  id               :bigint(8)        not null, primary key
#  details          :text
#  staff_id         :bigint(8)
#  takes_notes_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  parent_id        :bigint(8)
#

require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :details }
  end

  describe 'associations' do
    it { is_expected.to belong_to :staff }
    it { is_expected.to belong_to :takes_notes }
  end
end
