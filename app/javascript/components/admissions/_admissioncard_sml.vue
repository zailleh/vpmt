<template>
  <div class="appointment summary small">
    <CardMenu v-if="show" large/>
    <div class="details">
      <h4>Admission</h4>
      <p>
        <a v-bind:href="'#admissions/' + admission.id">
          {{ admission.when }}
        </a> 
      </p>
      <p class="notes">
        {{ admission.reason }}
      </p>
    </div>
    <CardMenu v-if="!show" />
  </div>
</template>

<script>
import CardMenu from './_cardmenu.vue'
export default {
  props: {
    admission: Object,
    show: Boolean
  },
  components: {
    CardMenu
  }
}
</script>
