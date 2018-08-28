json.extract! intervention, :id, :description, :created_at
json.type intervention.class.name

json.staff intervention.staff, :first_name, :last_name, :id