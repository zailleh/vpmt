<template>
  <div class="summary">
    <h3>New Customer</h3>
    <div v-if="errors.length > 0" class="form-error">
      <ul>
        <li v-for="error in errors" :key="error">{{ error }}</li>
      </ul>
    </div>
    <form action="" v-on:submit.prevent="createCustomer">
      <fieldset>
        <label for="first_name">First Name:</label>
        <input name="first_name" type="text" v-model="customer.first_name"/>
      </fieldset>
      <fieldset>
        <label for="last_name">Last Name:</label>
        <input name="last_name" type="text" v-model="customer.last_name"/>
      </fieldset>
      <fieldset>
        <label for="phone">Phone:</label>
        <input name="phone" type="text" v-model="customer.phone"/>
      </fieldset>
      <fieldset>
        <label for="mobile">Mobile:</label>
        <input name="mobile" type="text" v-model="customer.mobile"/>
      </fieldset>
      <fieldset>
        <label for="email">Email:</label>
        <input name="email" type="email" v-model="customer.email"/>
      </fieldset>
      <fieldset>
        <label for="street">Street Address:</label>
        <input name="street" type="text" v-model="customer.street"/>
      </fieldset>
      <fieldset>
        <label for="surburb">Suburb:</label>
        <input name="suburb" type="text" v-model="customer.suburb"/>
      </fieldset>
      <fieldset>
        <label for="post_code">Postcode:</label>
        <input name="post_code" type="string" v-model="customer.post_code"/>
      </fieldset>
      <button class="btn btn-submit">Submit</button>
    </form>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      customer: {
        first_name: '',
        last_name: '',
        phone: '',
        mobile: '',
        email: '',
        street: '',
        suburb: '',
        post_code: '',
      },
      errors: [],
      new_id: null,
    }
  },
  methods: {
    createCustomer() {
      fetch('/customers.json', {
        method: "POST", // *GET, POST, PUT, DELETE, etc.
        credentials: "same-origin", // include, same-origin, *omit
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        redirect: "follow", // manual, *follow, error
        referrer: "no-referrer", // no-referrer, *client
        body: JSON.stringify({ customer: this.$data.customer })
      })
      .then(function(response){ return response.json()})
      .then((function(data) {
        console.log(data);
        if (data.errors.length > 0) {
          this.errors = data.errors
        } else {
          // redirect to new customer's page
          window.location.href = '/#customers/' + data.new_id
        }
        // console.log(this.patients);
      }).bind(this))
    }
  }
}
</script>
