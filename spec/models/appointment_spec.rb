# == Schema Information
#
# Table name: appointments
#
#  id           :bigint(8)        not null, primary key
#  when         :datetime
#  reason       :text
#  staff_id     :bigint(8)
#  patient_id   :bigint(8)
#  admission_id :bigint(8)
#  customer_id  :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status_id    :bigint(8)
#

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :when }
  end

  describe 'associations' do
    it { is_expected.to belong_to :staff }
    it { is_expected.to belong_to :customer }
    it { is_expected.to belong_to :patient }
    it { is_expected.to have_one :admission }
    it { is_expected.to belong_to :appointment_status }
    it { is_expected.to have_many :interventions }
    it { is_expected.to have_many :notes }
  end
end
