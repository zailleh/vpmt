<template>
  <div class="customer summary">
    <p v-if="show" class="card-title">Client: {{ customer.first_name +' '+ customer.last_name }}</p>
    <p v-else class="card-title">
      <a v-bind:href="'#customers/' + customer.id">
        Client: {{ customer.first_name +' '+ customer.last_name }}
      </a>
    </p>
    <CardMenu v-if="show" large/>
    <div class="details">
      <fieldset>
        <label>Phone:</label>
        <p>{{ customer.phone }}</p>
      </fieldset>
      <fieldset>
        <label>Mobile:</label>
        <p>{{ customer.mobile }}</p>
      </fieldset>
      <fieldset>
        <label>Email:</label>
        <p>{{ customer.email }}</p>
      </fieldset>
    </div>
    <div class="details">
      <fieldset>
        <label>Street:</label>
        <p>{{ customer.street }}</p>
      </fieldset>
      <fieldset>
        <label>Suburb:</label>
        <p>{{ customer.suburb }}</p>
      </fieldset>
      <fieldset>
        <label>Post Code:</label>
        <p>{{ customer.post_code }}</p>
      </fieldset>
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
