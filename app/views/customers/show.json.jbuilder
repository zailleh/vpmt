json.partial! 'customers/customer', customer: @customer

json.patients @customer.patients, :id, :name, :img_url, :animal_type, :breed, :date_of_birth, :img_url