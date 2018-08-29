<template>
  <div :class="menuSize">
    <ul>
      <li>
        Admit Patient
      </li><li>
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
export default {
  data: function() {
    return {
      menuSize: 'menu' + (this.large ? '' : ' small')
    }
  },
  props: {
    large: Boolean
  },
  methods: {
    goToCustomer() {
      const custID = this.$parent.$props.appointment.customer.id;
      window.location.href = '/#customers/' + custID;
    }
  }
}
</script>
