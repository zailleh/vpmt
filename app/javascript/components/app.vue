<template>
  <div id="app">
    <Header />
    <div class="container">
      <Navbar />
      <main>
        <Router />
      </main>
    </div>
  </div>
</template>

<script>
  import Vue from 'vue';
  import Navbar from './navbar.vue'
  import Header from './header.vue'
  import Router from './router.vue'

  export default {
    components: {
      Navbar,
      Header,
      Router
    }
  }

  
</script>