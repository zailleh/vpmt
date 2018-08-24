require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { is_expected.to belong_to :staff }
  it { is_expected.to belong_to :customer }
  it { is_expected.to belong_to :patient }
  it { is_expected.to belong_to :admission, :optional => true }
  it { is_expected.to have_many :interventions }
end
