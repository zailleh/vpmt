<template>
  <nav id="navbar">
    <ul>
      <MenuItem v-for="value in sections" v-bind:name="value.name" v-bind:items="value.items"/>
    </ul>
  </nav>
</template>

<script>
import MenuItem from './menuItem.vue';

export default {
  data: function() {
    return {
      sections: {
        appointments: {
          name: "Appointments",
          items: [
            {
              href: "/#appointment",
              text: "All"
            },
            {
              href: "/#appointment/new",
              text: "New"
            }
          ]
        },
        patients: {
          name: "Patients",
          items: [
            {
              href: "/#patients",
              text: "All"
            },
            {
              href: "/#patients/new",
              text: "New"
            }
          ]
        },
        customers: {
          name: "Customers",
          items: [
            {
              href: "/#customer",
              text: "All"
            },
            {
              href: "/#customer/new",
              text: "New"
            }
          ]
        },
        admissions: {
          name: "Admissions",
          items: [
            {
              href: "/#admission",
              text: "All"
            },
            {
              href: "/#admission/new",
              text: "New"
            }
          ]
        }
      }
    }
  },
  components: {
    MenuItem
  }
}
</script>