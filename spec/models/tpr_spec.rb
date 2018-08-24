require 'rails_helper'

RSpec.describe Tpr, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column :temperature }
    it { is_expected.to have_db_column :resp_rate }
    it { is_expected.to have_db_column :pulse }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :temperature }
    it { is_expected.to validate_presence_of :resp_rate }
    it { is_expected.to validate_presence_of :pulse }
  end
  
  describe 'associations' do
    it { is_expected.to belong_to :admission }
    it { is_expected.to belong_to :staff }
  end

  # trps to recod the staff that did it
  # to be linked to the admission of the patient
  # must have temp, pressure and resp rate to be valid
end
