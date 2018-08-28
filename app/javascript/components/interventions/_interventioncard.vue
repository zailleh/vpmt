<template>
  <div class="intervention summary">
    <div class="details">
      <p>When: {{ intervention.created_at }}</p>
      <p>By: {{ intervention.staff.first_name + ' ' + intervention.staff.last_name }}</p>
    </div>
    <div class="details">
      <p>{{ intervention.description }}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    intervention: Object,
  },
}
</script>
