json.extract! tpr, :id, :temperature, :resp_rate, :pulse, :created_at

json.staff tpr.staff, :first_name, :last_name, :id