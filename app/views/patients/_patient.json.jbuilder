json.extract! patient, :id, :name, :img_url, :animal_type, :breed, :date_of_birth, :img_url

json.customer do
  json.extract! patient.customer, :first_name, :last_name, :mobile, :id
end