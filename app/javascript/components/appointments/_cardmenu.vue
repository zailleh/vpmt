<template>
  <div :class="menuSize">
    <ul>
      <li>
        Admit Patient
      </li><li>
        Add Note
      </li><li>
        Take Payment
      </li><li>
        Customer Record
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
