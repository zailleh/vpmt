# == Schema Information
#
# Table name: customers
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  street     :string
#  suburb     :string
#  post_code  :string
#  phone      :string
#  mobile     :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :street }
    it { is_expected.to have_db_column :suburb }
    it { is_expected.to have_db_column :post_code }
    it { is_expected.to have_db_column :phone }
    it { is_expected.to have_db_column :mobile }
    it { is_expected.to have_db_column :email }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :mobile }
    it { is_expected.to validate_presence_of :email }
  end

  describe 'associations' do
    it { is_expected.to have_many :patients }
    it { is_expected.to have_many :appointments }
    it { is_expected.to have_many :notes }
  end
end
