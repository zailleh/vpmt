require 'rails_helper'

RSpec.describe Staff, type: :model do
  it { is_expected.to have_secure_password }
  it { is_expected.to validated_uniqueness_of :email }
  it { is_expected.to have_many :shifts }
  it { is_expected.to have_many :interventions }
  it { is_expected.to have_many :appointments }
  it { is_expected.to have_many :tprs }
end
