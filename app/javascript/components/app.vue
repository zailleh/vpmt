<template>
  <div id="app">
    <Header :name="user_name" :logged-in="loggedIn" />
    <div class="container">
      <Navbar/>
      <main>
        <Router :name="user_name" v-if="loggedIn()" v-bind:routes="routes" />
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
        update: 0,
        user_id: localStorage.getItem('user_id'),
        user_name: localStorage.getItem('user_name')
      }
    },
    methods: {
      displayPopup(Component, params) {
        this.popupContent = Component;
        this.popupParams = params;
      },
      closePopup() {
        this.popupContent = null;
      },
      loggedIn: function() {
        const user_id = localStorage.getItem('user_id');
        return (typeof user_id !== "undefined" && user_id !== null)
      },
    },
    computed: {
      showPopup() {
        return this.popupContent != null;
      }
    },
    watch: {
      user_id: function() {
        this.loggedIn === true;
      }
    },
    components: {
      Navbar,
      Header,
      Router,
      Popup,
    }
  }
</script>
