<template>
  <div class="summary">
    <h3>New Patient</h3>
    <div v-if="errors.length > 0" class="form-error">
      <ul>
        <li v-for="error in errors" :key="error">{{ error }}</li>
      </ul>
    </div>
    <form enctype="multipart/form-data" v-on:submit.prevent="createPatient">
      <fieldset>
        <label for="name">Name:</label>
        <input name="name" type="text" v-model="patient.name" required/>
      </fieldset>
      <fieldset>
        <label for="date_of_birth">Date of Birth:</label>
        <input name="date_of_birth" type="date" v-model="patient.date_of_birth"  required/>
      </fieldset>
      <fieldset>
        <label for="breed">Breed:</label>
        <input name="breed" type="text" v-model="patient.breed"  required/>
      </fieldset>
      <fieldset>
        <label for="animal_type">Species:</label>
        <input name="animal_type" type="text" v-model="patient.animal_type"  required/>
      </fieldset>
      <fieldset class="span-2">
        <label for="img">Photo:</label>
        <input name="img" type="file" accept="image/*" @change="imgAdded"/>
      </fieldset>
      <button class="btn btn-submit">Submit</button>
    </form>
  </div>
</template>

<script>
import { closePopup } from '../helpers/_makePopup.js'

export default {
  props: ['customer_id'],
  data: function() {
    return {
      patient: {
        name: '',
        date_of_birth: '',
        breed: '',
        animal_type: '',
        customer_id: this.customer_id,
        img: null
      },
      errors: [],
      new_id: null,
    }
  },
  computed: {
    formData() {
      const formData = new FormData();
      Object.keys(this.patient).forEach( (key) => {
        if (key === 'img'){
          formData.append(key, this.patient[key], this.patient[key].name)
        } else {
          formData.append(key, this.patient[key])
        }
      })

      return formData
    }
  },
  mixins: [closePopup],
  methods: {
    imgAdded(e) {
      const file = e.target.files[0];
      this.patient.img = file;
    },
    createPatient() {
      fetch('/patients.json', {
        method: "POST", // *GET, POST, PUT, DELETE, etc.
        credentials: "same-origin", // include, same-origin, *omit
        // headers: {
        //     "Content-Type": "application/json; charset=utf-8",
        // },
        redirect: "follow", // manual, *follow, error
        referrer: "no-referrer", // no-referrer, *client
        body: this.formData
      })
      .then(function(response){ return response.json()})
      .then((function(data) {
        if (data.errors.length > 0) {
          this.errors = data.errors
        } else {
          // close self if popup redirect to new patient's page
          window.location.href = '/#patients/' + data.new_id;
          this.closePopup(); //close popup from mixin
          // this.$root.children[0].closePopup();
        }
      }).bind(this))
    }
  }
}
</script>
