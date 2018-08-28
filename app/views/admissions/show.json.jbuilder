json.partial! 'admissions/admission', admission: @admission

# get related tprs
json.tprs @admission.tprs, partial: 'tprs/tpr', as: :tpr

# get related schedules
json.schedules @admission.schedules, partial: 'schedules/schedule', as: :schedule


# get related interventions
json.interventions @admission.interventions, partial: 'interventions/intervention', as: :intervention

# get related notes
json.notes @admission.notes, partial: 'notes/note', as: :note