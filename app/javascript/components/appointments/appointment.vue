<template>
    <AppointmentCard 
      :appointment="appointment" 
      v-if="loaded"
      show/>
</template>


<script>
import AppointmentCard from './_appointmentcard.vue'
export default {
  props: {
    id: String,
  },
  data() {
    return {
      appointment: this.getAppointment(this.id),
      loaded: false,
    }
  },
  methods: {
    getAppointment(id) {
      fetch('/appointments/'+id+'.json', {
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
        this.appointment = data;
        this.loaded = true;
        // console.log(this.patients);
      }).bind(this))
    },
  },
  components: {
    AppointmentCard
  }
}
</script>
