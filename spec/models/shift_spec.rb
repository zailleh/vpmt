require 'rails_helper'

RSpec.describe Shift, type: :model do
  it { is_expected.to belong_to :staff }
end
