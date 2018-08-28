<template>
  <nav id="navbar">
    <ul>
      <MenuItem v-for="value in sections" v-bind:name="value.name" v-bind:items="value.items" :key="value.name"/>
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
              href: "/#appointments",
              text: "All"
            },
            {
              href: "/#appointments/new",
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
              href: "/#customers",
              text: "All"
            },
            {
              href: "/#customers/new",
              text: "New"
            }
          ]
        },
        admissions: {
          name: "Admissions",
          items: [
            {
              href: "/#admissions",
              text: "All"
            },
            {
              href: "/#admissions/new",
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