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
      <div class="tabs" id="tabs">
        <ul>
          <li id="showNotes" 
            v-on:click="selectTab"
            :class="tabs.showNotes || ''"
          >Notes</li>
          <li id="showTPRs"
            v-on:click="selectTab"
            :class="tabs.showTPRs || ''"
          >TPRs</li>
          <li id="showInterventions"
            v-on:click="selectTab"
            :class="tabs.showInterventions || ''"
          >Interventions</li>
          <li id="showSchedules"
            v-on:click="selectTab"
            :class="tabs.showSchedules || ''"
          >Schedules</li>
        </ul>
      </div>
      <div class="selected-data">
        <!-- TODO: put cards for selected type here -->
        <NoteCard v-if="tabs.showNotes" v-for="note in notes" :note="note" :key="note.id"/>
        <TPRCard v-if="tabs.showTPRs" v-for="tpr in tprs" :tpr="tpr" :key="tpr.id"/>
      </div>
    </div>
  </div>
</template>


<script>
import AdmissionCard from './_admissioncard.vue'
import NoteCard from '../notes/_notecard.vue'
import TPRCard from '../tprs/_tprcard.vue'
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
      tabs: {
        showNotes: false,
        showTPRs: 'selected',
      },
      interventions: [],
      schedules: [],
    }
  },
  methods: {
    selectTab(e) {
      Object.keys(this.tabs).forEach( (tab) => {
        if (tab === e.target.id) {
          this.tabs[tab] = 'selected';
        } else {
          this.tabs[tab] = false;
        }
      });
    },
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
    AdmissionCard,
    NoteCard,
    TPRCard,
  }
}
</script>
