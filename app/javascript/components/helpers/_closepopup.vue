<template>
  <button v-on:click="close">&times;</button>
</template>

<script>
export default {
  methods: {
    close() {
      this.$root.$children[0].closePopup();
    }
  }
}
</script>

