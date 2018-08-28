<template>
  <div class="schedule summary">
    <div class="details">
      <p>When: {{ schedule.start }}</p>
      <p>By: {{ schedule.staff.first_name + ' ' + schedule.staff.last_name }}</p>
    </div>
    <div class="details">
    </div>
  </div>
</template>

<script>
export default {
  props: {
    schedule: Object,
  },
}
</script>
