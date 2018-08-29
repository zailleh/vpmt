<template>
  <button v-on:click="close">&times;</button>
</template>

<script>
import { closePopup } from './_makePopup.js'

export default {
  mixins: [ closePopup ]
}
</script>