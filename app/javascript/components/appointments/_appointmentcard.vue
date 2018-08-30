<template>
  <div class="appointment summary">
    <p v-if="show" class="card-title">
      Appointment: {{ friendlyDate.date }} {{ friendlyDate.time }} - {{ appointment.patient.name }}
    </p>
    <p v-else class="card-title">
      <a v-bind:href="'#appointments/' + appointment.id">
        Appointment: {{ friendlyDate.date }} {{ friendlyDate.time }} - {{ appointment.patient.name }}
      </a>
    </p>
    <CardMenu v-if="show" large/>
    <div class="patient-image" style="grid-row: span 2">
      <img v-bind:src="appointment.patient.img_url" />
    </div>
    <fieldset style="grid-column: 2 / span 2;">
        <label>Reason:</label>
        <p class="notes">
          {{ appointment.reason }}
        </p>
      </fieldset>
    <div class="details">
      <h4>Patient Details:</h4>
      <fieldset>
        <label>Breed:</label>
        <p>{{ appointment.patient.breed }}</p>
      </fieldset>
      <fieldset>
        <label>Age:</label>
        <p>
          <span v-if="patientAge.years > 0">
            {{ patientAge.years }} years
          </span>
          <span v-if="patientAge.months > 0">
            {{ patientAge.months }} months
          </span>
        </p>
      </fieldset>
    </div>
    <div class="details">
      <h4>Client Details:</h4>
      <fieldset>
        <label>Namer:</label>
        <p>
          {{ appointment.customer.first_name + ' ' + appointment.customer.last_name }}
        </p>
      </fieldset>
      <fieldset>
        <label>Mobile:</label>
        <p>
          {{ appointment.customer.mobile }}
        </p>
      </fieldset>
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
  computed: {
    friendlyDate() {
      const date = (new Date(this.appointment.when))
      return {
        date: date.toLocaleDateString(),
        time: date.toLocaleTimeString().slice(0,-3),
      }
    },
    patientAge() {
      const mspy = 31449600000 //milliseconds per year
      const msdif = (Date.now() - (new Date(this.appointment.patient.date_of_birth))) / mspy
      const remainder =  msdif % 1
      console.log('years', msdif)
      return {
        years: msdif - remainder,
        months: Number.parseInt(remainder * 12)
      }
    }
  },
  components: {
    CardMenu
  }
}
</script>
