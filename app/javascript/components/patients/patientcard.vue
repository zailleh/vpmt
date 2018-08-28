<template>
  <div class="patient summary">
    <CardMenu v-if="show"  large/>
    <div class="patient-image">
      <img v-bind:src="patient.img_url" />
    </div>
    <div class="details">
        <p v-if="show">{{ patient.name }}</p>
        <p v-else>
          <a v-bind:href="'#patients/' + patient.id">
            {{ patient.name }}
          </a>
        </p>
      <p>{{ patient.breed }}</p>
      <p>{{ patient.date_of_birth }}</p>
    </div>
    <div v-if="patient.customer" class="details">
      <p>
        <a :href="'#customers/' + patient.customer.id" >
          {{ patient.customer.first_name + ' ' + patient.customer.last_name }}
        </a>
      </p>
      <p>
        {{ patient.customer.mobile }}
      </p>
      <p class="notes">
        <!-- {{ patient.notes }} -->
      </p>
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
  components: {
    CardMenu
  }
}
</script>
