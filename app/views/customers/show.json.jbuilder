json.partial! 'customers/customer', customer: @customer

json.patients @customer.patients, :id, :name, :img_url, :breed, :date_of_birth, :img_url