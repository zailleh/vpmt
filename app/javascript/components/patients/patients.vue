<template>
  <div>
    <h1>All Patients</h1>
    <PatientCard v-for="patient in patients" v-bind:patient="patient" :key="patient.id" />
  </div>
</template>

<script>
import PatientCard from './patientcard.vue'

export default {
  data: function() {
    return {
      patients: this.getPatients(),
    }
  },
  methods: {
    getPatients: function() {
      fetch('/patients.json', {
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
        this.patients = data;
        // console.log(this.patients);
      }).bind(this))
    }
  },
  components: {
    PatientCard
  }
}
</script>
