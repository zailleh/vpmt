require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { is_expected.to have_many :patients }
  it { is_expected.to have_many :appointments }
end
