import Vue from 'vue';
import App from '../components/app.vue';

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el,
    render: h => h(App)
  })
})



