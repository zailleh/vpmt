# == Schema Information
#
# Table name: staffs
#
#  id              :bigint(8)        not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  password_digest :text
#  photo_url       :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Staff, type: :model do
  describe 'has columns' do
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :password_digest }
    it { is_expected.to have_db_column :photo_url }
  end

  describe 'validates' do
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :email }
  end

  describe 'associations' do
    it { is_expected.to have_many :shifts }
    it { is_expected.to have_many :interventions }
    it { is_expected.to have_many :appointments }
    it { is_expected.to have_many :tprs }
  end
end
