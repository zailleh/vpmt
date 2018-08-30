<template>
  <div class="appointment summary">
    <p v-if="show" class="card-title">
      {{title}}
    </p>
    <p v-else class="card-title">
      <a v-bind:href="'#appointments/' + appointment.id">
       {{title}}
      </a>
    </p>
    <CardMenu v-if="show" :status="appointment.status" large/>
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
    <CardMenu v-if="!show" :status="appointment.status" />
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
    title() {
      return `Appointment: ${ this.friendlyDate.date } ${this. friendlyDate.time } - ${ this.appointment.status.status } - ${ this.appointment.patient.name }`
    },
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
