require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :when }
  end

  describe 'associations' do
    it { is_expected.to belong_to :staff }
    it { is_expected.to belong_to :customer }
    it { is_expected.to belong_to :patient }
    it { is_expected.to belong_to :admission, :optional => true }
    it { is_expected.to have_many :interventions }
    it { is_expected.to have_many :notes }
  end
end
