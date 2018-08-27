<template>
  <div>
    <h1>All Customers</h1>
    <CustomerCard v-for="customer in customers" v-bind:customer="customer" />
  </div>
</template>

<script>
import CustomerCard from './_customercard.vue'

export default {
  data: function() {
    return {
      customers: this.getCustomers(),
      loaded: false,
    }
  },
  methods: {
    getCustomers: function() {
      fetch('/customers.json', {
        method: "GET", // *GET, POST, PUT, DELETE, etc.
        credentials: "same-origin", // include, same-origin, *omit
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        redirect: "follow", // manual, *follow, error
        referrer: "no-referrer", // no-referrer, *client
      })
      .then(function(response){ return response.json()})
      .then((function(data) {
        // console.log(this);
        this.customers = data;
        this.loaded = true;
        // console.log(this.patients);
      }).bind(this))
    }
  },
  components: {
    CustomerCard
  }
}
</script>
