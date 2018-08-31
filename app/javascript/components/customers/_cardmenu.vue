<template>
  <div :class="menuSize">
    <ul>
      <li v-on:click="popup(patient, popupProps)">
        Add Pet
      </li><li @click="popup(noteForm, noteProps)">
        Add Note
      </li>
      <!-- <li>
        Update Record
      </li> -->
    </ul>
  </div>
</template>

<script>
import { makePopup } from '../helpers/_makePopup.js'
import PatientForm from '../patients/patientform.vue';
import NoteForm from '../notes/_noteform.vue'

export default {
  data: function() {
    return {
      menuSize: 'menu' + (this.large ? '' : ' small'),
      patient: PatientForm,
      noteForm: NoteForm,
      noteProps: {
        parent_id: this.$parent.customer.id,
        takes_notes_type: 'Customer'
      }
      // note: NoteForm
    }
  },
  props: {
    large: Boolean
  },
  computed: {
     popupProps() {
      return {
        customer_id: this.$parent.$props.customer.id
      }
    },
  },
  mixins: [ makePopup ]
}
</script>
