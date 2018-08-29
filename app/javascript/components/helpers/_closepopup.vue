<template>
  <button v-on:click="closePopup">&times;</button>
</template>

<script>
import { closePopup } from './_makePopup.js'

export default {
  mixins: [ closePopup ]
}
</script>