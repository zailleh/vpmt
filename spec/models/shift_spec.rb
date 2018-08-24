require 'rails_helper'

RSpec.describe Shift, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :start }
    it { is_expected.to validate_presence_of :end }
  end

  describe 'associations' do
    it { is_expected.to belong_to :staff }
    it { is_expected.to belong_to :role }
  end
end
