require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it { is_expected.to belong_to :admission }
  it { is_expected.to have_many :interventions }
end
