<template>
  <div class="appointment summary">
    <CardMenu v-if="show" large/>
    <div class="details">
        <p v-if="show">{{ customer.first_name +' '+ customer.last_name }}</p>
        <p v-else>
          <a v-bind:href="'#customers/' + customer.id">
            {{ customer.first_name +' '+ customer.last_name }}
          </a>
        </p>
      <p>{{ customer.mobile }}</p>
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
