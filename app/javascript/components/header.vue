<template>
 <header>
    <div>
      <span class="logo">VPMT - Wellpet</span>
    </div>
    <div>
      <ul class="staff-menu">
        <li v-if="name">{{ name }}</li>
        <li v-else @click="popup(loginForm)">Login</li>
        <li v-if="name" @click="logout">Logout</li>
      </ul>
    </div>
  </header>
</template>

<script>
import { makePopup } from './helpers/_makePopup.js';
import LoginForm from './loginform.vue';

export default {
  props: {
    name: String
  },
  data: function () {
    return {
      loginForm: LoginForm
    }
  },
  mixins: [ makePopup ],
  methods: {
    logout: function() {
      localStorage.removeItem('user_id');
      localStorage.removeItem('user_name');
      this.$root.$children[0].user_name = null;
      this.$root.$children[0].user_id = null;
    }
  }
}
</script>