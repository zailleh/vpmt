<template>
  <div class="summary">
    <h3>New Note</h3>
    <div v-if="errors.length > 0" class="form-error">
      <ul>
        <li v-for="error in errors" :key="error">{{ error }}</li>
      </ul>
    </div>
    <form @submit.prevent="createNote">
      <fieldset>
        <label>When:</label>
        <input type="text" disabled v-model="when">
      </fieldset>
      <fieldset>
        <label for="staff_name">Staff:</label>
        <div>
          <input autocomplete="off" name="staff_name" type="text" v-model="staff_name" @input="getSuggestions()" />
          <div class="autocomplete-list">
            <div class="autocomplete-items" 
              v-for="staff in suggestions" 
              @click="selectStaff(staff)" 
              :key="staff.id"
            >
              {{ staff.first_name + ' ' + staff.last_name }}
            </div>
          </div>
        </div>
      </fieldset>
      <fieldset>
        <label>Details:</label>
        <textarea v-model="note.details" />
      </fieldset>
      <button class="btn btn-submit">Save</button>
    </form>
  </div>
</template>

<script>
import staffSearch from '../helpers/_staffsearch.js';
import { makePopup } from '../helpers/_makePopup.js';
import MessageBox from '../helpers/_messageBox.vue';

export default {
  props: {
    parent_id: Number,
    takes_notes_type: String,
  },
  data: function() {
    return {
      note: {
        details: '',
        staff_id: '',
        parent_id: this.$props.parent_id,
        takes_notes_type: this.$props.takes_notes_type
      },
      when: (new Date).toJSON(),
      errors: [],
    }
  },
  watch: {
    staff_id: function() {
      this.note.staff_id = this.staff_id;
    }
  },
  mixins: [staffSearch,makePopup],
  methods: {
    createNote() {
      fetch('/notes.json', {
        method: "POST", // *GET, POST, PUT, DELETE, etc.
        credentials: "same-origin", // include, same-origin, *omit
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        redirect: "follow", // manual, *follow, error
        referrer: "no-referrer", // no-referrer, *client
        body: JSON.stringify({ note: this.$data.note })
      })
      .then(function(response){ return response.json()})
      .then((function(data) {
        if (data.errors.length > 0) {
          this.errors = data.errors
        } else {
          this.popup(MessageBox,{message: "Note created successfully"})
        }
        // console.log(this.patients);
      }).bind(this))
    }
  }
}
</script>
