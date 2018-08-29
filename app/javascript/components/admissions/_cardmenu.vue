<template>
  <div :class="menuSize">
    <ul>
      <li>
        Discharge Patient
      </li><li @click="popup(noteForm, noteProps)">
        Add Note
      </li><li>
        Add TPR
      </li><li>
        Add Intervention
      </li><li>
        Add Schedule
      </li>  
    </ul>
  </div>
</template>

<script>
import Popup, { makePopup } from '../helpers/_makePopup.js'
import NoteForm from '../notes/_noteform.vue'

export default {
  data: function() {
    return {
      menuSize: 'menu' + (this.large ? '' : ' small'),
      noteForm: NoteForm,
      noteProps: {
        parent_id: this.$parent.admission.id,
        takes_notes_type: 'Admission'
      }
    }
  },
  mixins: [makePopup],
  props: {
    large: Boolean
  }
}
</script>
