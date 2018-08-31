<template>
  <div class="tpr summary">
    <h2>Record TPR</h2>
    <div v-if="errors.length > 0" class="form-error">
      <ul>
        <li v-for="error in errors" :key="error">{{ error }}</li>
      </ul>
    </div>
    <form @submit.prevent="createTpr">
      <fieldset>
        <label for="created_at_date">Date:</label>
        <input name="created_at_date" type="date" v-model="created_at_date" required/>
      </fieldset>
      <fieldset>
        <label for="created_at_time">Time:</label>
        <input name="created_at_time" type="time" step="60" v-model="created_at_time" required/>
      </fieldset>
      <fieldset>
        <label for="staff_name">Staff:</label>
        <div>
          <input autocomplete="off" name="staff_name" type="text" v-model="staff_name" @input="getSuggestions()" required/>
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
        <label for="temp">Temp:</label>
        <input name="temp" type="number" step="0.01" v-model="tpr.temperature" />
      </fieldset>
      <fieldset>
        <label for="resp">Resp Rate:</label>
        <input name="resp" type="number" step="0.01" v-model="tpr.resp_rate"/>
      </fieldset>
      <fieldset>
        <label for="pulse">HR:</label>
        <input name="pulse" type="number" step="0.01" v-model="tpr.pulse"/>
      </fieldset>
      <button>Save</button>
    </form>
  </div>
</template>

<script>
import staffSearch from '../helpers/_staffsearch.js';
import { makePopup } from '../helpers/_makePopup.js';
import MessageBox from '../helpers/_messageBox.vue';

export default {
  props: {
    admission_id: Number,
  },
  data: function() {
    return {
      tpr: {
        temperature: '',
        resp_rate: '',
        pulse: '',
        staff_id: '',
        created_at: '',
        admission_id: this.$props.admission_id,
      },
      errors: [],
      created_at_time: (new Date()).toLocaleTimeString().slice(0,-3),
      created_at_date: this.defaultDate(),
    }
  },
  watch: {
    created_at_date: function() {
      console.log('date changed');
      this.when();
    },
    created_at_time: function() {
      this.when();
    },
    staff_id: function() {
      this.tpr.staff_id = this.staff_id;
    }
  },
  mixins: [staffSearch,makePopup],
  methods: {
    defaultDate() {
      const local = new Date();
      local.setMinutes(local.getMinutes() - local.getTimezoneOffset());
      return local.toJSON().slice(0,10);
    },
    when() {
      this.tpr.created_at = this.created_at_date + " " + this.created_at_time
    },
    createTpr() {
      this.when();
      fetch('/tprs.json', {
        method: "POST", // *GET, POST, PUT, DELETE, etc.
        credentials: "same-origin", // include, same-origin, *omit
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        redirect: "follow", // manual, *follow, error
        referrer: "no-referrer", // no-referrer, *client
        body: JSON.stringify({ tpr: this.$data.tpr })
      })
      .then(function(response){ return response.json()})
      .then((function(data) {
        if (data.errors.length > 0) {
          this.errors = data.errors
        } else {
          this.popup(MessageBox,{message: "TPR created successfully"})
        }
      }).bind(this))
    }
  }
}
</script>
