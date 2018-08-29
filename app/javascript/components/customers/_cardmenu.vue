<template>
  <div :class="menuSize">
    <ul>
      <li v-on:click="popup(patient, popupProps)">
        Add Pet
      </li><li>
        Add Note
      </li><li>
        Update Record
      </li>
    </ul>
  </div>
</template>

<script>
import Popup, { makePopup } from '../helpers/_makePopup.js'
import PatientForm from '../patients/patientform.vue';

export default {
  data: function() {
    return {
      menuSize: 'menu' + (this.large ? '' : ' small'),
      patient: PatientForm,
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
  mixins: [makePopup]
}
</script>
