import Home from './home.vue'
import Patients from './patients/patients.vue'
import Patient from './patients/patient.vue'
import Admissions from './admissions/admissions.vue'
import Admission from './admissions/admission.vue'
import Appointments from './appointments/appointments.vue'
import Appointment from './appointments/appointment.vue'
import Customers from './customers/customers.vue'
import Customer from './customers/customer.vue'
import CustomerForm from './customers/customerform.vue'
import NotFound from './notfound.vue'

export default {
    '/#': Home,
    '/': Home,
    '/#patients': Patients,
    '/#patients/:id': Patient,
    '/#admissions/filter/:filter': Admissions,
    '/#admissions/:id': Admission,
    '/#appointments/filter/:filter': Appointments,
    '/#appointments/:id': Appointment,
    '/#customers': Customers,
    '/#customers/new': CustomerForm,
    '/#customers/:id': Customer,
    'NotFound': NotFound,
  };