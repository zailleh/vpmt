<template>
  <div>
     <PatientCard v-if="loaded" v-bind:patient="patient" show/>
     <PatientHistory v-if="loaded" :lists="lists" />
  </div>
</template>


<script>
import PatientCard from './patientcard.vue';
import PatientHistory from './_patienthistory.vue';
import AdmissionCard from '../admissions/_admissioncard_sml.vue'
import AppointmentCard from '../appointments/_appointmentcard_sml.vue'

export default {
  props: ['id'],
  data: function() {
    return {
      patient: this.getPatientData(this.id),
      loaded: false,
    }
  },
  computed: {
    lists() {
      return [
        {
          component: AdmissionCard,
          name: 'admission',
          list: this.patient.admissions,
        },
        {
          component: AppointmentCard,
          name: 'appointment',
          list: this.patient.appointments,
        }
      ]
    }
  },
  methods: {
    getPatientData(id) {
      fetch('/patients/'+id+'.json', {
        method: "GET", // *GET, POST, PUT, DELETE, etc.
        credentials: "same-origin", // include, same-origin, *omit
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        redirect: "follow", // manual, *follow, error
        referrer: "no-referrer", // no-referrer, *client
      })
      .then(function(response){ return response.json()})
      .then((function(data) {
        // console.log(this);
        this.patient = data;
        this.loaded = true;
        // console.log(this.patients);
      }).bind(this))
    }
  },
  components: {
    PatientCard,
    PatientHistory
  }
}
</script>
