<template>
  <div>
    <Loader v-if="!loaded" />
    <AdmissionCard 
      v-else
      v-for="admission in admissions" 
      :admission="admission" 
      :key="admission.id"
    />
  </div>
</template>


<script>
import AdmissionCard from './_admissioncard.vue';
import Loader from '../loader.vue';

export default {
  props: {
    filter: String,
  },
  data() {
    return {
      loaded: false,
      admissions: this.getAdmissions(),
    }
  },  
  watch: {
    filter: function(){this.getAdmissions()},
  },
  methods: {
    getAdmissions() {
      fetch('/admissions/filter/'+this.filter+'.json', {
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
        this.admissions = data;
        this.loaded = true;
      }).bind(this))
    },
  },
  components: {
    AdmissionCard,
    Loader
  }
}
</script>
