<template>
  <div :class="menuSize">
    <ul>
      <li>
        Add Pet
      </li><li>
        Add Note
      </li><li>
        Update Record
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      menuSize: 'menu' + (this.large ? '' : ' small')
    }
  },
  props: {
    large: Boolean
  }
}
</script>
