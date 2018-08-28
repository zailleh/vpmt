<template>
  <div :class="menuSize">
    <ul>
      <li>
        Discharge Patient
      </li><li>
        Add Note
      </li><li>
        Add TPR
      </li><li>
        Add Intervention
      </li><li>
        Add Schedule
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
