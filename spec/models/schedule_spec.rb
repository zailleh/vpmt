require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :start }
  end

  describe 'associations' do
    it { is_expected.to belong_to :staff }
    it { is_expected.to belong_to :admission }
    it { is_expected.to have_many :interventions }
    it { is_expected.to have_many :notes }
  end
end
