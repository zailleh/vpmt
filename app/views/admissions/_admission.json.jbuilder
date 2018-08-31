json.extract! admission, :id, :reason
json.type admission.admit_type.type_name

json.status do 
  json.extract! admission.status, :next, :prev, :status
  if admission.status.next_status.nil?
    json.next_status nil
  else
    json.next_status admission.status.next_status.status
  end
end

json.patient do
  json.extract! admission.patient, :img_url, :name, :date_of_birth, :breed, :animal_type
end

json.customer do
  json.extract! admission.patient.customer, :first_name, :last_name, :mobile
end