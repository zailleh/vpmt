<template>
  <div :class="menuSize">
    <ul>
      <li v-if="status.next_status" @click="nextStatus">
        {{ status.next_status }}
      </li><li>
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
    large: Boolean,
    status: Object,
  },
  mixins: [ makePopup ],
  methods: {
    goToCustomer() {
      const custID = this.$parent.$props.appointment.customer.id;
      window.location.href = '/#customers/' + custID;
    },
    nextStatus() {
      fetch('/appointments/'+ this.noteProps.parent_id +'.json', {
        method: "PUT", // *GET, POST, PUT, DELETE, etc.
        credentials: "same-origin", // include, same-origin, *omit
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        redirect: "follow", // manual, *follow, error
        referrer: "no-referrer", // no-referrer, *client
        body: JSON.stringify({ appointment: { status_id: this.status.next } })
      })
      .then(function(response){ return response.json()})
      .then((function(data) {
        console.log(data);
        if (data.errors && data.errors.length > 0) {
          this.errors = data.errors
        } else {
          console.log(this.$parent);
          console.log(data);
          this.$parent.appointment = data;
        }
      }).bind(this))
    }
  },
  
}
</script>
