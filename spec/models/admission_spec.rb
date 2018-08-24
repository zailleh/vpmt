require 'rails_helper'

RSpec.describe Admission, type: :model do
  it { is_expected.to belong_to :patient }
  it { is_expected.to have_many :tprs }
  it { is_expected.to have_many :interventions }
  it { is_expected.to belong_to :appointment, :optional => true }
end
