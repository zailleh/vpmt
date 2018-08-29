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
        customers: {
          name: "Clients",
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
        appointments: {
          name: "Appointments",
          items: [
            {
              href: "/#appointments/schedule",
              text: "Schedule"
            },
            {
              href: "/#appointments/checked-in",
              text: "Checked-In"
            },
            {
              href: "/#appointments/consult",
              text: "In Consult"
            },
            {
              href: "/#appointments/pay",
              text: "Ready-to-Pay"
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
        admissions: {
          name: "Inpatients",
          items: [
            {
              href: "/#admissions",
              text: "Hospital"
            },
            {
              href: "/#admissions",
              text: "Day Patient"
            },
            {
              href: "/#admissions",
              text: "Proceedure"
            },
            {
              href: "/#admissions",
              text: "Strays"
            },
            {
              href: "/#admissions",
              text: "Strays (Injured)"
            },
            {
              href: "/#admissions",
              text: "Wildlife"
            },
            {
              href: "/#admissions",
              text: "Wildlife (Injured)"
            },
          ]
        },
        boarding: {
          name: "Boarding",
          items: [
            {
              href: "/#admissions",
              text: "All"
            },
            {
              href: "/#admissions",
              text: "With Meds"
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