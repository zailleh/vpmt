json.extract! admission, :id, :reason

json.patient do
  json.extract! admission.patient, :img_url, :name, :date_of_birth, :breed, :animal_type
end

json.customer do
  json.extract! admission.patient.customer, :first_name, :last_name, :mobile
end