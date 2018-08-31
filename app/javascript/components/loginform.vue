<template>
 <div class="summary">
    <h3>Login</h3>
    <div v-if="errors.length > 0" class="form-error">
      <ul>
        <li v-for="error in errors" :key="error">{{ error }}</li>
      </ul>
    </div>
    <form @submit.prevent="login">
      <fieldset>
        <label for="email">Email:</label>
        <input name="email" type="email" v-model="email" required />
      </fieldset>
      <fieldset>
        <label for="password">Password:</label>
        <input name="password" type="password" v-model="password" required />
      </fieldset>
      <button class="btn btn-submit">Login</button>
    </form>
  </div>
</template>

<script>
import { closePopup } from './helpers/_makePopup.js'
export default {
  data: function() {
    return {
      email: '',
      password: '',
      errors: [],
    }
  },
  methods: {
    login() {
      fetch('/staff/login.json', {
        method: "PUT", // *GET, POST, PUT, DELETE, etc.
        credentials: "same-origin", // include, same-origin, *omit
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        redirect: "follow", // manual, *follow, error
        referrer: "no-referrer", // no-referrer, *client
        body: JSON.stringify(this.$data)
      })
      .then(function(response){ return response.json()})
      .then((function(data) {
        if (data.errors.length > 0) {
          this.errors = data.errors;
        } else {
          // close self if popup redirect to new patient's page
          // debugger;
          localStorage.setItem('user_id', data.user_id);
          localStorage.setItem('user_name', data.user_name);
          this.$root.$children[0].user_name = data.user_name;
          this.$root.$children[0].user_id = data.user_id;
          this.closePopup(); //close popup from mixin
          // this.$root.children[0].closePopup();
        }
      }).bind(this))
    }
  },
  mixins: [ closePopup ]
}
</script>
