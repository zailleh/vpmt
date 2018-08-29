<template>
  <div class="appointment summary">
    <p v-if="show" class="card-title">Appointment: {{ appointment.when }}</p>
    <p v-else class="card-title">
      <a v-bind:href="'#appointments/' + appointment.id">
        Appointment: {{ appointment.when }}
      </a>
    </p>
    <CardMenu v-if="show" large/>
    <div class="patient-image">
      <img v-bind:src="appointment.patient.img_url" />
    </div>
    <div class="details">
      <p>{{ appointment.patient.name }}</p>
      <p>{{ appointment.patient.breed }}</p>
      <p>{{ appointment.patient.date_of_birth }}</p>
    </div>
    <div class="details">
      <p>
        {{ appointment.customer.first_name + ' ' + appointment.customer.last_name }}
      </p>
      <p>
        {{ appointment.customer.mobile }}
      </p>
      <p class="notes">
        {{ appointment.reason }}
      </p>
    </div>
    <CardMenu v-if="!show" />
  </div>
</template>

<script>
import CardMenu from './_cardmenu.vue'
export default {
  props: {
    appointment: Object,
    show: Boolean
  },
  components: {
    CardMenu
  }
}
</script>
