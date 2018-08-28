<template>
  <div :class="menuSize">
    <ul>
      <li v-on:click="popup">
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
import PatientForm from '../patients/patientform.vue';

export default {
  data: function() {
    return {
      menuSize: 'menu' + (this.large ? '' : ' small')
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
  methods: {
    popup() {
      const params = this.popupProps
      this.$root.$children[0].displayPopup(PatientForm, params);
    },
  }
}
</script>
