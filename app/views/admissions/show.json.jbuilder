json.partial! 'admissions/admission', admission: @admission

# get related tprs
json.tprs @admission.tprs do |tpr|
  json.extract! tpr, :id
end

# get related tprs
json.schedules @admission.schedules do |schedule|
  json.extract! schedule, :id
end

# get related interventions
json.interventions @admission.interventions do |intervention|
  json.extract! intervention, :id
end

# get related notes
json.notes @admission.notes do |note|
  json.extract! note, :id, :details
end