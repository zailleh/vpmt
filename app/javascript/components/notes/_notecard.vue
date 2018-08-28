<template>
  <div class="note summary">
    <div class="details">
      <p>When: {{ note.created_at }}</p>
      <p>By: {{ note.staff.first_name + ' ' + note.staff.last_name }}</p>
    </div>
    <div class="details">
      <p>{{ note.details }}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    note: Object,
  },
}
</script>
