<template>
  <div class="appointment summary">
    <CardMenu v-if="show" large/>
    <div class="details">
      <h4>Appointment</h4>
      <p v-if="show">{{ appointment.when }}</p>
      <p v-else>
        <a v-bind:href="'#appointments/' + appointment.id">
          {{ appointment.when }}
        </a>
      </p>
    </div>
    <div class="details">
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
