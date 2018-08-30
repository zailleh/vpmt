<template>
  <div>
    <h1>All Patients</h1>
    <Loader v-if="!loaded" />
    <PatientCard v-else v-for="patient in patients" v-bind:patient="patient" :key="patient.id" />
  </div>
</template>

<script>
import PatientCard from './patientcard.vue'
import Loader from '../loader.vue'

export default {
  data: function() {
    return {
      patients: this.getPatients(),
      loaded: false,
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
        this.loaded = true;
        // console.log(this.patients);
      }).bind(this))
    }
  },
  components: {
    PatientCard,
    Loader
  }
}
</script>
