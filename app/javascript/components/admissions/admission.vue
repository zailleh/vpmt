<template>
  <div>
    <AdmissionCard 
      :admission="admission" 
      v-if="loaded"
      show
    />
    <div class="admission-latest">
      <!-- TODO: show latest note, tpr, intervention -->
    </div>
    <div class="admission-tabs">
      <div id="tabs">
        <ul>
          <li class="selected">Notes</li>
          <li>TPRs</li>
          <li>Interventions</li>
          <li>Schedules</li>
        </ul>
      </div>
      <div class="selected-data">
        <!-- TODO: put cards for selected type here -->
      </div>
    </div>
  </div>
</template>


<script>
import AdmissionCard from './_admissioncard.vue'
export default {
  props: {
    id: String,
  },
  data() {
    return {
      admission: this.getAdmission(this.id),
      loaded: false,
      tprs: [],
      notes: [],
      interventions: [],
      schedules: [],
    }
  },
  methods: {
    getAdmission(id) {
      fetch('/admissions/'+id+'.json', {
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
        this.admission = data;
        this.tprs = data.tprs;
        this.notes = data.notes;
        this.interventions = data.interventions;
        this.schedule = data.schedules;
        this.loaded = true;
      }).bind(this))
    },
  },
  components: {
    AdmissionCard
  }
}
</script>
