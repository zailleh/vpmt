<template>
  <div id="app">
    <Header />
    <div class="container">
      <Navbar />
      <main>
        <Router v-bind:routes="routes" />
      </main>
    </div>
    <div v-if="showPopup" class="popup">
      <Popup :content="popupContent" :params="popupParams"/>
    </div>
  </div>
</template>

<script>
  import Vue from 'vue';
  import Navbar from './navbar.vue';
  import Header from './header.vue';
  import Popup from './popup.vue';
  import Router from './router.vue';
  import routes from './routes';
  
  // console.log(routes);
  export default {
    data: function() {
      return {
        routes,
        popupContent: null,
        popupParams: null,
      }
    },
    methods: {
      displayPopup(Component, params) {
        this.popupContent = Component;
        this.popupParams = params;
      },
      closePopup() {
        this.popupContent = null;
      }
    },
    computed: {
      showPopup() {
        return this.popupContent != null;
      },
    },
    components: {
      Navbar,
      Header,
      Router,
      Popup,
    }
  }
</script>
