# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Note.destroy_all
ScheduledIntervention.destroy_all
Schedule.destroy_all
Intervention.destroy_all
Tpr.destroy_all
Admission.destroy_all
Appointment.destroy_all
Patient.destroy_all
Customer.destroy_all
Shift.destroy_all
Role.destroy_all
Staff.destroy_all

# STAFF
st1 = Staff.create({
  first_name: 'Lisa',
  last_name: 'Yang',
  email: 'Lisa.Yang@vpmt.com',
  password: 'chicken',
  photo_url: ''
})

# ROLES
r1 = Role.create({name: 'Reception'})
r2 = Role.create({name: 'Hospital'})
r3 = Role.create({name: 'Ward'})
r4 = Role.create({name: 'Hospital 2'})
r5 = Role.create({name: 'All-rounder'})
r6 = Role.create({name: 'Proceedures'})

# SHIFTS (STAFF + ROLES = SHIFTS)
sh1 = Shift.create({
  start: DateTime.now,
  end: DateTime.now + 8.hours,
  staff: st1,
  role: r1
})

# CUSTOMERS
c1 = Customer.create({
  first_name: 'Tim',
  last_name: 'Caldwell',
  street: '9 Blah Street',
  suburb: 'Bighorn',
  post_code: '1234',
  phone: '(02) 01201 01201',
  email: 'tim.caldwell@blah.co',
  mobile: '04 2524 2524',
})

# PATIENTS (REQUIRES CUSTOMER)
#  name          :string
#  date_of_birth :date
#  breed         :string
#  animal_type   :string
#  customer_id   :bigint(8)
p1 = Patient.create({
  name: 'Helo',
  date_of_birth: Date.today - 7.years,
  breed: 'Domestic Short Hair',
  animal_type: 'Cat',
  customer: c1
})

# APPOINTMENTS (PATIENT + CUSTOMER + STAFF)
#  when         :datetime
#  reason       :text
#  staff_id     :bigint(8)
#  patient_id   :bigint(8)
#  admission_id :bigint(8)
#  customer_id  :bigint(8)
ap1 = Appointment.create({
  when: Date.today + 13.5.hours,
  reason: 'Vomiting yellowy stuff frequently and has not been eating',
  patient: p1,
  customer: c1,
  staff: st1
})

# ADMISSIONS (REQUIRES PATIENT + STAFF)
#  reason         :text
#  staff_id       :bigint(8)
#  patient_id     :bigint(8)
#  appointment_id :bigint(8)
ad1 = Admission.create({
  reason: 'Appears to have something stuck in stomach',
  staff: st1,
  patient: p1,
  appointment: ap1
})

# TPRs (STAFF + ADMISSION = TPR)
#  temperature  :float
#  resp_rate    :float
#  pulse        :float
#  admission_id :bigint(8)
#  staff_id     :bigint(8)
t1 = Tpr.create({
  temperature: 38.4,
  resp_rate: 59,
  pulse: 118,
  admission: ad1,
  staff: st1
})


# INTERVENTIONS (REQUIRES APPOINTMENT OR ADMISSION)
#  description    :text
#  admission_id   :bigint(8)
#  appointment_id :bigint(8)
#  staff_id       :bigint(8)
i1 = Intervention.create({
  description: 'Provide with vomit inducing medicine',
  admission: ad1,
  appointment: nil,
  staff: st1
})

# SCHEDULE (REQUIRES ADMISSION)
#  start        :datetime
#  staff_id     :bigint(8)
#  admission_id :bigint(8)
s1 = Schedule.create({
  start: DateTime.now,
  staff: st1,
  admission: ad1
})

# SCHEDULED INTERVENTION (REQUIRES ADMISSION)
#  description    :text
#  admission_id   :bigint(8)
#  appointment_id :bigint(8)
#  staff_id       :bigint(8)
#  schedule_id    :bigint(8)
#  status         :string
si1 = ScheduledIntervention.create({
  description: 'give iv fluids',
  admission: ad1,
  schedule: s1,
  status: 'Pending'
})

# NOTES
#  details    :text
#  staff_id   :bigint(8)
# Create on patient
p1.notes.create({
  staff: st1,
  details: 'Scared easily, provide quiet cage if possible and give ketamine to calm'
})

# create on schedule
s1.notes.create({
  staff: st1,
  details: "This schedule sucks"
})

# create note on customer
c1.notes.create({
  staff: st1,
  details: "This customer is cranky all the time, it's not your fault. Dont consider for blood doner program"
})

# create note on appointment
ap1.notes.create({
  staff: st1,
  details: "Saw Helo and he was lethargic and seemed to be in pain. Recommending admission for monitoring, fluids, and administering vom-inducing-stuff"
})

# create note on admission
ad1.notes.create({
  staff: st1,
  details: "Admitting to hospital for monitoring since not eating and generally not well."
})



