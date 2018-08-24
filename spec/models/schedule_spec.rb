# == Schema Information
#
# Table name: schedules
#
#  id           :bigint(8)        not null, primary key
#  start        :datetime
#  staff_id     :bigint(8)
#  admission_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :start }
  end

  describe 'associations' do
    it { is_expected.to belong_to :staff }
    it { is_expected.to belong_to :admission }
    it { is_expected.to have_many :scheduled_interventions }
    it { is_expected.to have_many :notes }
  end
end
