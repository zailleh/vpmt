json.partial! 'patients/patient', patient: @patient

json.admissions(@patient.admissions) do |admission|
  json.extract! admission, :id, :reason
  json.when admission.created_at
end

# get related interventions
# json.interventions @patient.interventions, partial: 'interventions/intervention', as: :intervention

json.appointments(@patient.appointments) do |appointment|
  json.extract! appointment, :id, :reason
  json.when appointment.when
end