# == Schema Information
#
# Table name: admissions
#
#  id             :bigint(8)        not null, primary key
#  reason         :text
#  staff_id       :bigint(8)
#  patient_id     :bigint(8)
#  appointment_id :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  admit_type_id  :bigint(8)
#  admit_at       :datetime
#  discharge_at   :datetime
#  status_id      :bigint(8)
#

require 'rails_helper'

RSpec.describe Admission, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of :reason }
  end

  describe 'associations' do
    it { is_expected.to belong_to :staff }
    it { is_expected.to belong_to :patient }
    it { is_expected.to have_many :tprs }
    it { is_expected.to have_many :interventions }
    it { is_expected.to have_many :schedules }
    it { is_expected.to belong_to :appointment }
    it { is_expected.to have_many :notes }
    it { is_expected.to belong_to :admit_type }
    it { is_expected.to belong_to :status }
  end
end
