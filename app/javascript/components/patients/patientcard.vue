<template>
  <div class="patient summary">
    <p v-if="show" class="card-title">Patient: {{ patient.name }}</p>
    <p v-else class="card-title">
      <a v-bind:href="'#patients/' + patient.id">
        Patient: {{ patient.name }}
      </a>
    </p>
    <CardMenu v-if="show"  large/>
    <div class="patient-image">
      <img v-bind:src="patient.img_url" />
    </div>
    <div class="details">
      <fieldset>
        <label>Species:</label>
        <p>{{ patient.animal_type }}</p>
      </fieldset>
      <fieldset>
        <label>Breed:</label>
        <p>{{ patient.breed }}</p>
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
    <div v-if="patient.customer" class="details">
      <h4>Client Details:</h4>
      <fieldset>
        <label>Name:</label>
        <p>
          <a :href="'#customers/' + patient.customer.id" >
            {{ patient.customer.first_name + ' ' + patient.customer.last_name }}
          </a>
        </p>
      </fieldset>
      <fieldset>
        <label>Mobile:</label>
        <p>
          {{ patient.customer.mobile }}
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
    patient: Object,
    show: Boolean
  },
  computed: {
    patientAge() {
      const mspy = 31449600000 //milliseconds per year
      const msdif = (Date.now() - (new Date(this.patient.date_of_birth))) / mspy
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
