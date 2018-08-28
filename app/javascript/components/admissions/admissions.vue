<template>
  <div>
    <AdmissionCard 
      v-for="admission in admissions" 
      :admission="admission" 
      :key="admission.id"
    />
  </div>
</template>


<script>
import AdmissionCard from './_admissioncard.vue'
export default {
  data() {
    return {
      admissions: this.getAdmissions(),
    }
  },
  methods: {
    getAdmissions() {
      fetch('/admissions.json', {
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
        // console.log(this);
        this.admissions = data;
        // console.log(this.patients);
      }).bind(this))
    },
  },
  components: {
    AdmissionCard
  }
}
</script>
