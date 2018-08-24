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

class ScheduledIntervention < Intervention
  validates_presence_of :status
  validate :staff_required?

  belongs_to :schedule

  private
    def staff_required?
      if self.status == "Complete" && self.staff.nil?
        errors.add(:staff_id, "must be associated when the intervention is complete.")
      end
    end
end
