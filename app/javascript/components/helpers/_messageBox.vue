<template>
  <div class="messagebox">
    <p>{{ message }}</p>
    <button class="btn" @click="closePopup">Ok</button>
  </div>
</template>

<script>
import { closePopup } from './_makePopup.js'

export default {
  props: {
    message: String
  },
  mixins: [ closePopup ]
}
</script>
