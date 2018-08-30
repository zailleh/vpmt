<template>
  <div class="appointment summary">
    <p v-if="show" class="card-title">Inpatient: {{ admission.patient.name }}</p>
    <p v-else class="card-title">
      <a v-bind:href="'#admissions/' + admission.id">
        Inpatient: {{ admission.patient.name }}
      </a>
    </p>
    <CardMenu v-if="show" large/>
    <div class="patient-image" style="grid-row: span 2">
      <img v-bind:src="admission.patient.img_url" />
    </div>
    <fieldset style="grid-column: 2 / span 2">
        <label>Admit Reason:</label>
        <p class="notes">
          {{ admission.reason }}
        </p>
      </fieldset>
    <div class="details">
      <h4>Client Details:</h4>
      <fieldset>
        <label>Name:</label>
        <p>
          {{ admission.customer.first_name + ' ' + admission.customer.last_name }}
        </p>
      </fieldset>
      <fieldset>
        <label>Mobile:</label>
        <p>
          {{ admission.customer.mobile }}
        </p>
      </fieldset>
    </div>
    <div class="details">
      <h4>Patient Details:</h4>
      <fieldset>
        <label>Species:</label>
        <p>{{ admission.patient.animal_type }}</p>
      </fieldset>
      <fieldset>
        <label>Breed:</label>
        <p>{{ admission.patient.breed }}</p>
      </fieldset>
      <fieldset>
        <label>Age:</label>
        <p>{{ admission.patient.date_of_birth }}</p>
      </fieldset>
    </div>
    <CardMenu v-if="!show" />
  </div>
</template>

<script>
import CardMenu from './_cardmenu.vue'
export default {
  props: {
    admission: Object,
    show: Boolean
  },
  components: {
    CardMenu
  }
}
</script>
