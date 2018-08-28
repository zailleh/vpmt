<template>
  <div class="tpr summary">
    <div class="details">
      <p>When: {{ tpr.created_at }}</p>
      <p>By: {{ tpr.staff.first_name + ' ' + tpr.staff.last_name }}</p>
    </div>
    <div class="details">
      <p>Temp:&#09;{{ tpr.temperature }}</p>
      <p>Resp:&#09;{{ tpr.resp_rate }}</p>
      <p>Pulse:&#09;{{ tpr.pulse }}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    tpr: Object,
  },
}
</script>
