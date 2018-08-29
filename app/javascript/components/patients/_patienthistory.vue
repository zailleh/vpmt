<template>
  <div class="history summary">
    <HistoryItem v-for="item in history" :key="item.id + Math.random()" :component="item.component" :params="item" />
  </div>
</template>

<script>
import HistoryItem from '../helpers/_historyitem.vue';

export default {  
  props: {
    lists: Array,
  },
  data: function() {
    return {
      history: this.calculateHistory(),
    }
  },
  methods: {
    calculateHistory() {
      const newList = this.lists.reduce( (arr, group) => {
        // build typed list
        const tempList = group.list.map( (item) => {
          return {
            component: group.component,
            [group.name]: item
          }
        });
        // add each item to arr
        arr.push(...tempList)
        return arr
      }, [])

      return newList;
    }
  },
  components: {
    HistoryItem,
  }
}
</script>
