import Home from './home.vue'
import Patients from './patients/patients.vue'
import Admissions from './admissions/admissions.vue'
import Appointments from './appointments/appointments.vue'
import Customers from './customers/customers.vue'
import NotFound from './notfound.vue'

export default {
    '/#': Home,
    '/': Home,
    '/#patients': Patients,
    '/#admission': Admissions,
    '/#appointment': Appointments,
    '/#customer': Customers,
    'NotFound': NotFound,
  };