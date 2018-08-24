require 'rails_helper'

RSpec.describe Admission, type: :model do
  describe 'validates' do
    it { is_expected.to validates_presence_of :reason }
  end

  describe 'associations' do
    it { is_expected.to belong_to :staff }
    it { is_expected.to belong_to :patient }
    it { is_expected.to have_many :tprs }
    it { is_expected.to have_many :interventions }
    it { is_expected.to have_many :schedules }
    it { is_expected.to belong_to :appointment, :optional => true }
    it { is_expected.to have_many :notes }
  end
end
