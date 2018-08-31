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
              text: "Find"
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
              href: "/#appointments/filter/schedule",
              text: "Schedule"
            },
            {
              href: "/#appointments/filter/checked-in",
              text: "Checked-In"
            },
            {
              href: "/#appointments/filter/consult",
              text: "In Consult"
            },
            {
              href: "/#appointments/filter/Ready to Pay",
              text: "Ready-to-Pay"
            }
          ]
        },
        patients: {
          name: "Patients",
          items: [
            {
              href: "/#patients",
              text: "Find"
            },
          ]
        },
        admissions: {
          name: "Inpatients",
          items: [
            {
              href: "/#admissions/filter/hospital",
              text: "Hospital"
            },
            {
              href: "/#admissions/filter/day patient",
              text: "Day Patient"
            },
            {
              href: "/#admissions/filter/procedure",
              text: "Procedures"
            },
            {
              href: "/#admissions/filter/stray",
              text: "Strays"
            },
            {
              href: "/#admissions/filter/stray (injured)",
              text: "Strays (Injured)"
            },
            {
              href: "/#admissions/filter/wildlife",
              text: "Wildlife"
            },
            {
              href: "/#admissions/filter/wildlife (injured)",
              text: "Wildlife (Injured)"
            },
          ]
        },
        boarding: {
          name: "Boarding",
          items: [
            {
              href: "/#admissions/filter/boarding",
              text: "All"
            },
            {
              href: "/#admissions/filter/boarding meds",
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