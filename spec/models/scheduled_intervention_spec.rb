# == Schema Information
#
# Table name: interventions
#
#  id             :bigint(8)        not null, primary key
#  description    :text
#  admission_id   :bigint(8)
#  appointment_id :bigint(8)
#  staff_id       :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  schedule_id    :bigint(8)
#  status         :string
#

require 'rails_helper'

RSpec.describe ScheduledIntervention, type: :model do
  it 'has STI from Intervention' do
    expect(ScheduledIntervention.superclass).to be Intervention
  end

  describe 'associations' do
    it { is_expected.to belong_to :schedule }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :status }
    let (:scheduled_intervention) { ScheduledIntervention.new }
    
    context 'when scheduled intervention is pending' do
      before { scheduled_intervention.status = "Pending" }

      it 'is valid without an associated staff member' do
        scheduled_intervention.valid?
        errs =  scheduled_intervention.errors.full_messages 

        expect(errs).to_not include("Staff must be associated when the intervention is complete.")
      end
    end

    context 'when scheduled intervention is complete' do
      before { scheduled_intervention.status = "Complete" }
      
      it 'is invalid without an associated staff member' do
        scheduled_intervention.valid?
        errs =  scheduled_intervention.errors.full_messages 

        expect(errs).to include("Staff must be associated when the intervention is complete.")
      end
    end
  end
end
