<script>
import Vue from 'vue';
import Home from './home.vue';
import Patients from './patients.vue';
import NotFound from './notfound.vue'

const routes = {
    '/': Home,
    '/patients': Patients,
  };

  const path = window.location.pathname;
  const last = path.length - 1;
  

  const Router = Vue.component('Router', {
    data() {
      return {
        currentRoute: path !== '/' && path[last] === '/' ? path.slice(0,last) : path
      }
    },
    computed: {
      viewComponent() {
        console.log(routes[this.currentRoute]);
        return routes[this.currentRoute] || NotFound
      }
    },
    render(createElement) {
      return createElement(this.viewComponent)
    },
  });

  export default Router;
</script>