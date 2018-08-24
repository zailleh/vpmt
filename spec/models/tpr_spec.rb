require 'rails_helper'

RSpec.describe Tpr, type: :model do
  it { is_expected.to belong_to :admission }
  it { is_expected.to belong_to :staff }
end
