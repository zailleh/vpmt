<template>
  <div :class="menuSize">
    <ul>
      <li v-if="status.next_status" @click="nextStatus">
        {{ status.next_status }}
      </li>
      <!-- <li v-if="status.next_status">
        Discharge Patient
      </li> -->
      <li @click="popup(noteForm, noteProps)">
        Add Note
      </li><li @click="popup(tprForm, tprProps)">
        Add TPR
      </li><!-- <li>
        Add Intervention
      </li><li>
        Add Schedule
      </li>   -->
    </ul>
  </div>
</template>

<script>
import Popup, { makePopup } from '../helpers/_makePopup.js'
import NoteForm from '../notes/_noteform.vue'
import TprForm from '../tprs/_tprform.vue'

export default {
  data: function() {
    return {
      menuSize: 'menu' + (this.large ? '' : ' small'),
      noteForm: NoteForm,
      noteProps: {
        parent_id: this.$parent.admission.id,
        takes_notes_type: 'Admission'
      },
      tprForm: TprForm,
      tprProps: {
        admission_id: this.$parent.admission.id,
      }
    }
  },
  mixins: [makePopup],
  props: {
    large: Boolean,
    status: Object,
  },
  methods: {
    nextStatus() {
      fetch('/admissions/'+ this.tprProps.admission_id +'.json', {
        method: "PUT", // *GET, POST, PUT, DELETE, etc.
        credentials: "same-origin", // include, same-origin, *omit
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        redirect: "follow", // manual, *follow, error
        referrer: "no-referrer", // no-referrer, *client
        body: JSON.stringify({ admission: { status_id: this.status.next } })
      })
      .then(function(response){ return response.json()})
      .then((function(data) {
        // console.log(data);
        if (data.errors && data.errors.length > 0) {
          this.errors = data.errors
        } else {
          // console.log(this.$parent);
          // console.log(data);
          this.$parent.admission = data;
        }
      }).bind(this))
    }
  }
}
</script>
