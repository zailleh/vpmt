<template>
  <div>
    <Loader v-if="!loaded" />
    <CustomerCard 
      v-if="loaded"
      v-bind:customer="customer" 
      show
    />
    <PatientCard 
      v-if="loaded"
      v-for="patient in patients"
      :patient="patient"
      :key="patient.id"
    />
  </div>
</template>

<script>
import CustomerCard from './_customercard.vue';
import PatientCard from '../patients/patientcard.vue';
import Loader from '../loader.vue'

export default {
  props: {
    id: String,
  },
  data: function() {
    return {
      customer: this.getCustomer(this.id),
      patients: [],
      loaded: false,
    }
  },
  methods: {
    getCustomer: function(id) {
      fetch('/customers/'+id+'.json', {
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
        this.customer = data;
        this.patients = data.patients;
        this.loaded = true;
        // console.log(this.patients);
      }).bind(this))
    }
  },
  components: {
    CustomerCard,
    PatientCard,
    Loader
  }
}
</script>
