<template>
  <div id="app">
    <Header />
    <div class="container">
      <Navbar />
      <main>
        <Router v-bind:routes="routes" />
      </main>
    </div>
  </div>
</template>

<script>
  import Vue from 'vue';
  import Navbar from './navbar.vue'
  import Header from './header.vue'
  import Router from './router.vue'

  import Home from './home.vue'
  import Patients from './patients.vue'
  import NotFound from './notfound.vue'

  const routes = {
      '/#': Home,
      '/': Home,
      '/#patients': Patients,
      'NotFound': NotFound,
    };
  
  export default {
    data: function() {
      return {
        routes
      }
    },
    components: {
      Navbar,
      Header,
      Router
    }
  }
</script>
