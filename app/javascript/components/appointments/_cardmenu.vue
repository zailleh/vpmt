<template>
  <div :class="menuSize">
    <ul>
      <li>
        Admit Patient
      </li><li @click="popup(noteForm, noteProps)">
        Add Note
      </li><li>
        Take Payment
      </li><li @click="goToCustomer">
        Customer Record
      </li>  
    </ul>
  </div>
</template>

<script>
import NoteForm from '../notes/_noteform.vue';
import { makePopup } from '../helpers/_makePopup.js'

export default {
  data: function() {
    return {
      menuSize: 'menu' + (this.large ? '' : ' small'),
      noteForm: NoteForm,
      noteProps: {
        parent_id: this.$parent.appointment.id,
        takes_notes_type: 'Admission'
      }
    }
  },
  props: {
    large: Boolean
  },
  mixins: [ makePopup ],
  methods: {
    goToCustomer() {
      const custID = this.$parent.$props.appointment.customer.id;
      window.location.href = '/#customers/' + custID;
    }
  },
  
}
</script>
