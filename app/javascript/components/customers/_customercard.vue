<template>
  <div class="customer summary">
    <CardMenu v-if="show" large/>
    <div class="details">
        <p v-if="show">{{ customer.first_name +' '+ customer.last_name }}</p>
        <p v-else>
          <a v-bind:href="'#customers/' + customer.id">
            {{ customer.first_name +' '+ customer.last_name }}
          </a>
        </p>
      <p>{{ customer.phone }}</p>
      <p>{{ customer.mobile }}</p>
      <p>{{ customer.email }}</p>
    </div>
    <div class="details">
      <p>{{ customer.street }}</p>
      <p>{{ customer.suburb }}</p>
      <p>{{ customer.post_code }}</p>
    </div>
    <CardMenu v-if="!show" />
  </div>
</template>

<script>
import CardMenu from './_cardmenu.vue'
export default {
  props: {
    customer: Object,
    show: Boolean
  },
  components: {
    CardMenu
  }
}
</script>
