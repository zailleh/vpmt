require_relative './seed_data/cat_names.rb'
require_relative './seed_data/dog_names.rb'
require_relative './seed_data/people_names.rb'
require_relative './seed_data/street_names.rb'
require_relative './seed_data/town_names.rb'
require_relative './seed_data/cat_breeds.rb'
require_relative './seed_data/dog_breeds.rb'

require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
Note.destroy_all
ScheduledIntervention.destroy_all
Schedule.destroy_all
Intervention.destroy_all
Tpr.destroy_all
Admission.destroy_all
Appointment.destroy_all
AppointmentStatus.destroy_all
Patient.destroy_all
Customer.destroy_all
Shift.destroy_all
Role.destroy_all
Staff.destroy_all

# APPOINTMENT STATUS
as1 = AppointmentStatus.create!({
  status: 'Booked'
})
as2 = AppointmentStatus.create!({
  status: 'Checked-In'
})
as3 = AppointmentStatus.create!({
  status: 'Consult'
})
as4 = AppointmentStatus.create!({
  status: 'Ready to Pay'
})
as5 = AppointmentStatus.create!({
  status: 'Complete'
})

as1.next_status = as2

as2.previous_status = as1
as2.next_status = as3

as3.previous_status = as2
as3.next_status = as4

as4.previous_status = as3
as4.next_status = as5

as5.previous_status = as4

as1.save!
as2.save!
as3.save!
as4.save!
as5.save!

staff = []
1.upto 50 do
  # STAFF
  #  first_name      :string
  #  last_name       :string
  #  email           :string
  #  password_digest :text
  #  photo_url       :text

  first = FIRST_NAMES.sample
  last = SURNAMES.sample

  staff.push(
    Staff.create!({
      :first_name => first,
      :last_name => last,
      :email => first + '.' + last + '@vetpractice.com',
      :password => 'chicken'
    })
  )
  
 
end


# ROLES
roles = []
roles << Role.create!({name: 'Reception'})
roles << Role.create!({name: 'Hospital'})
roles << Role.create!({name: 'Ward'})
roles << Role.create!({name: 'Hospital 2'})
roles << Role.create!({name: 'All-rounder'})
roles << Role.create!({name: 'Proceedures'})

# SHIFTS (STAFF + ROLES = SHIFTS)
#  start      :datetime
#  end        :datetime
#  role_id    :bigint(8)
#  staff_id   :bigint(8)
1.upto 50 do
  staff.each do |st|
    shift_start = Date.today + rand(4..19).hours + rand(-7..7).days
    shift_end = shift_start + rand(4..12).hours
    Shift.create!({
      :start => shift_start,
      :end => shift_end,
      :role => roles.sample,
      :staff => st
    })
  end
end

# CUSTOMERS
#  first_name :string
#  last_name  :string
#  street     :string
#  suburb     :string
#  post_code  :string
#  phone      :string
#  mobile     :string
#  email      :string
customers = []
1.upto 300 do
  firstname =  FIRST_NAMES.sample
  surname = SURNAMES.sample
  cust = Customer.create!({
    :first_name => firstname,
    :last_name => surname,
    :street => rand(1..100).to_s + ' ' + STREET_NAMES.sample,
    :suburb => TOWN_NAMES.sample,
    :post_code => rand(2000...7000).to_s,
    :phone => '0' + rand(2..7).to_s + rand(1000..9999).to_s + rand(1000..9999).to_s,
    :mobile => '04' + rand(1000..9999).to_s + rand(1000..9999).to_s,
    :email => firstname + '.' + surname + rand(99..1000).to_s + '@somemail.com',
  })

  # if customer didn't save, next loop
  next unless cust.valid?

  # PATIENTS (REQUIRES CUSTOMER)
  #  name          :string
  #  date_of_birth :date
  #  breed         :string
  #  animal_type   :string
  #  customer_id   :bigint(8)
  #  img_url       :text
  1.upto rand(1..3) do
    if rand > 0.5 
      # make dog
      patient = Patient.create!({
        :name => DOG_NAMES.sample,
        :date_of_birth => Date.today - rand(0..15).years - rand(0..11).months,
        :breed => DOG_BREEDS.sample,
        :animal_type => "Dog",
        :customer => cust,
        :img_url => "http://www.placepuppy.net/#{rand(150..250)}/#{rand(150..250)}"
      })
    else
      # make cat
      patient = Patient.create!({
        :name => CAT_NAMES.sample,
        :date_of_birth => Date.today - rand(0..15).years - rand(0..11).months,
        :breed => CAT_BREEDS.sample,
        :animal_type => "Cat",
        :customer => cust,
        :img_url => "https://placekitten.com/#{rand(150..250)}/#{rand(150..250)}"
      })
    end
    
    next unless patient.valid?

    # APPOINTMENTS (PATIENT + CUSTOMER + STAFF)
    #  when         :datetime
    #  reason       :text
    #  staff_id     :bigint(8)
    #  patient_id   :bigint(8)
    #  admission_id :bigint(8)
    #  customer_id  :bigint(8)
    1.upto rand(1..5) do
      apdate = Date.today + rand(-7..7).days + rand(9..19).hours
      ap = Appointment.create!({
        :when => apdate,
        :reason => Faker::Lorem.sentence,
        :staff => staff.sample,
        :patient => patient,
        :customer => cust,
        :status => (apdate < DateTime.now - 1.hour ? as5 : apdate < DateTime.now ? as3 : as1)
      })

      1.upto rand(0..1) do
        # ADMISSIONS (REQUIRES PATIENT + STAFF)
        #  reason         :text
        #  staff_id       :bigint(8)
        #  patient_id     :bigint(8)
        #  appointment_id :bigint(8)
        admission = Admission.create!({
          :reason => Faker::Lorem.sentence,
          :staff => staff.sample,
          :patient => patient,
          :appointment => ap
        })

        1.upto rand(2..5) do
          # TPRs (STAFF + ADMISSION = TPR)
          #  temperature  :float
          #  resp_rate    :float
          #  pulse        :float
          #  admission_id :bigint(8)
          #  staff_id     :bigint(8)
          Tpr.create!({
            :admission => admission,
            :staff => staff.sample,
            :temperature => rand(36.0..41.0),
            :resp_rate => rand(60..180),
            :pulse => rand(90..140),
          })
        end
      end
    end


    1.upto rand(0..1) do
      # ADMISSIONS (REQUIRES PATIENT + STAFF)
      #  reason         :text
      #  staff_id       :bigint(8)
      #  patient_id     :bigint(8)
      #  appointment_id :bigint(8)  
      admission = Admission.create!({
        :reason => Faker::Lorem.sentence,
        :staff => staff.sample,
        :patient => patient,
      })

        1.upto rand(2..5) do
          # TPRs (STAFF + ADMISSION = TPR)
          #  temperature  :float
          #  resp_rate    :float
          #  pulse        :float
          #  admission_id :bigint(8)
          #  staff_id     :bigint(8)
          Tpr.create!({
            :admission => admission,
            :staff => staff.sample,
            :temperature => rand(36.0..41.0),
            :resp_rate => rand(60..180),
            :pulse => rand(90..140),
          })
        end

        1.upto rand(2..5) do
          # INTERVENTIONS (REQUIRES APPOINTMENT OR ADMISSION)
          #  description    :text
          #  admission_id   :bigint(8)
          #  appointment_id :bigint(8)
          #  staff_id       :bigint(8)

        end
    end
  end
end


# SCHEDULE (REQUIRES ADMISSION)
#  start        :datetime
#  staff_id     :bigint(8)
#  admission_id :bigint(8)


# SCHEDULED INTERVENTION (REQUIRES ADMISSION)
#  description    :text
#  admission_id   :bigint(8)
#  appointment_id :bigint(8)
#  staff_id       :bigint(8)
#  schedule_id    :bigint(8)
#  status         :string


# NOTES
#  details    :text
#  staff_id   :bigint(8)
# create! on patient


# create! on schedule


# create! note on customer


# create! note on appointment


# create! note on admission