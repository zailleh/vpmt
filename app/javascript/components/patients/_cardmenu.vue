<template>
  <div :class="menuSize">
    <ul>
      <li @click="popup(appointment, parentParams)">
        Make Appointment
      </li><li @click="popup(noteForm, noteProps)">
        Add Note
      </li><li>
        Update Record
      </li><li @click="goToCustomer">
        Customer Record
      </li>  
    </ul>
  </div>
</template>

<script>
import { makePopup } from '../helpers/_makePopup.js'
import NoteForm from '../notes/_noteform.vue'
import AppointmentForm from '../appointments/appointmentform.vue'

export default {
  data: function() {
    return {
      menuSize: 'menu' + (this.large ? '' : ' small'),
      appointment: AppointmentForm,
      noteForm: NoteForm,
      noteProps: {
        parent_id: this.$parent.patient.id,
        takes_notes_type: 'Patient'
      }
    }
  },
  computed: {
    parentParams() {
      const p = this.$parent.$props.patient
      return {
        patient_id: p.id,
      }
    }
  },
  props: {
    large: Boolean
  },
  mixins: [ makePopup ],
  methods: {
    goToCustomer() {
      const custID = this.$parent.$props.patient.customer.id;
      window.location.href = '/#customers/' + custID;
    }
  }
}
</script>
