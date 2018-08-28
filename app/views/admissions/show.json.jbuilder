json.partial! 'admissions/admission', admission: @admission

# get related tprs
json.tprs @admission.tprs, partial: 'tprs/tpr', as: :tpr

# get related tprs
json.schedules @admission.schedules do |schedule|
  json.extract! schedule, :id
end

# get related interventions
json.interventions @admission.interventions do |intervention|
  json.extract! intervention, :id
end

# get related notes
json.notes @admission.notes, partial: 'notes/note', as: :note