<template>
  <div>
    <AppointmentCard 
      v-for="appointment in appointments" 
      :appointment="appointment" 
      :key="appointment.id"
    />
  </div>
</template>


<script>
import AppointmentCard from './_appointmentcard.vue'
export default {
  props: {
    filter: String
  },
  data: function() {
    return {
      appointments: this.getAppointments()
    }
  },
  watch: {
    filter: function(){this.getAppointments()},
  },
  methods: {
    getAppointments() {
      fetch('/appointments/filter/'+ this.filter +'.json', {
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
        this.appointments = data;
      }).bind(this))
    },
  },
  components: {
    AppointmentCard
  }
}
</script>
