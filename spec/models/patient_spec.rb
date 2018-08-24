require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :age }
    it { is_expected.to validate_presence_of :breed }
    it { is_expected.to validate_presence_of :animal_type }
  end

  describe 'associations' do
    it { is_expected.to have_many :admissions }
    it { is_expected.to have_many :appointments }
    it { is_expected.to belong_to :customer}
    it { is_expected.to have_many :notes }
  end
end
