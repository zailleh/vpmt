require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :details }
  end

  describe 'associations' do
    it { is_expected.to belong_to :staff }
  end
end