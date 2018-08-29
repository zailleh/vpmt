<template>
  <div class="summary">
    <h3>New Appointment</h3>
    <div v-if="errors.length > 0" class="form-error">
      <ul>
        <li v-for="error in errors" :key="error">{{ error }}</li>
      </ul>
    </div>
    <form action="" v-on:submit.prevent="createAppointment">
      <fieldset>
        <label for="date">Date:</label>
        <input name="date" type="date" v-model="date"/>
      </fieldset>
       <fieldset>
        <label for="time">Time:</label>
        <input name="time" type="time" v-model="time"/>
      </fieldset>
      <fieldset>
        <label for="staff_name">With:</label>
        <div>
          <input autocomplete="off" name="staff_name" type="text" v-model="staff_name" @input="getSuggestions()">
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
        <label for="reason">Reason:</label>
        <textarea name="reason" type="text" v-model="appointment.reason"/>
      </fieldset>
      <button>Submit</button>
    </form>
  </div>
</template>

<script>
import { closePopup } from '../helpers/_makePopup.js'

export default {
  props: {
    customer_id: Number,
    patient_id: Number
  },
  data: function() {
    return {
      appointment: {
        when: '',
        patient_id: this.patient_id,
        staff_id: '',
        reason: '',
      },
      staff_name: '',
      date: '',
      time: '',
      suggestions: [],
      errors: [],
      new_id: null,
    }
  },
  watch: {
    date: function() {
      console.log('date changed');
      this.when();
    },
    time: function() {
      this.when();
    }
  },
  mixins: [closePopup],
  methods: {
    when() {
      this.appointment.when = this.date + " " + this.time
    },
    selectStaff(staff) {
      this.staff_name = staff.first_name + ' ' + staff.last_name;
      this.appointment.staff_id = staff.id;
      this.suggestions = [];
    },
    getSuggestions() {
      if (this.staff_name.length < 3) {
        this.suggestions = []
        this.appointment.staff_id = ''
      } else {
        this.appointment.staff_id = ''
        fetch('/search/staff.json', {
          method: "POST", // *GET, POST, PUT, DELETE, etc.
          credentials: "same-origin", // include, same-origin, *omit
          headers: {
              "Content-Type": "application/json; charset=utf-8",
          },
          redirect: "follow", // manual, *follow, error
          referrer: "no-referrer", // no-referrer, *client
          body: JSON.stringify({ search: this.$data.staff_name })
        })
        .then(function(response){ return response.json()})
        .then((function(data) {
          this.suggestions = data
        }).bind(this))
      }
    },
    createAppointment() {
      console.log(this.$data.appointment);
      fetch('/appointments.json', {
        method: "POST", // *GET, POST, PUT, DELETE, etc.
        credentials: "same-origin", // include, same-origin, *omit
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        redirect: "follow", // manual, *follow, error
        referrer: "no-referrer", // no-referrer, *client
        body: JSON.stringify({ appointment: this.$data.appointment })
      })
      .then(function(response){ return response.json()})
      .then((function(data) {
        console.log(data);
        if (data.errors.length > 0) {
          this.errors = data.errors
        } else {
          // redirect to new customer's page
          window.location.href = '/#appointments/' + data.new_id;
          console.log(this);
          this.closePopup()
          
        }
        // console.log(this.patients);
      }).bind(this))
    }
  }
}
</script>
