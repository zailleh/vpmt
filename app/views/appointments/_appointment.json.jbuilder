json.extract! appointment, :id, :when, :reason

json.status do 
  json.extract! appointment.status, :next, :prev, :status
  if appointment.status.next_status.nil?
    json.next_status nil
  else
    json.next_status appointment.status.next_status.status
  end
end

json.patient do
  json.extract! appointment.patient, :img_url, :name, :date_of_birth, :breed, :animal_type, :id
end

json.customer do
  json.extract! appointment.customer, :first_name, :last_name, :mobile, :id
end