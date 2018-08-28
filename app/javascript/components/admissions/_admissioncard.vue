<template>
  <div class="appointment summary">
    <CardMenu v-if="show" large/>
    <div class="patient-image">
      <img v-bind:src="admission.patient.img_url" />
    </div>
    <div class="details">
        <p v-if="show">{{ admission.patient.name }}</p>
        <p v-else>
          <a v-bind:href="'#admissions/' + admission.id">
            {{ admission.patient.name }}
          </a>
        </p>
      <p>{{ admission.patient.name }}</p>
      <p>{{ admission.patient.breed }}</p>
      <p>{{ admission.patient.date_of_birth }}</p>
    </div>
    <div class="details">
      <p>
        {{ admission.customer.first_name + ' ' + admission.customer.last_name }}
      </p>
      <p>
        {{ admission.customer.mobile }}
      </p>
      <p class="notes">
        {{ admission.reason }}
      </p>
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
