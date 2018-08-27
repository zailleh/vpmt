json.extract! appointment, :id, :when, :reason

json.patient do
  json.extract! appointment.patient, :img_url, :name, :date_of_birth, :breed, :animal_type
end

json.customer do
  json.extract! appointment.customer, :first_name, :last_name, :mobile
end