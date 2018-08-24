# == Schema Information
#
# Table name: interventions
#
#  id             :bigint(8)        not null, primary key
#  description    :text
#  admission_id   :bigint(8)
#  appointment_id :bigint(8)
#  staff_id       :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Intervention, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of :description }
  end

  describe 'associations' do
    it { is_expected.to belong_to :staff }
    it { is_expected.to belong_to :appointment }
    it { is_expected.to belong_to :admission }
  end
end
