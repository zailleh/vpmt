<template>
  <li v-on:click="toggleActive">
    <span>{{ name }}</span>
    <ul class="submenu">
      <li v-for="item in items">
        <a v-bind:href="item.href">{{item.text}}</a>
      </li>
    </ul>
  </li>
</template>

<script>
export default {
  props: {
    name: String,
    items: Array
  },
  methods: {
    toggleActive: function(){
      const sideMenu = document.querySelector('nav > ul');
      const menuItems = new Array(...sideMenu.children);
      menuItems.forEach((li) => li.classList.remove('active'));
      this.$el.classList.add('active');
    }
  }
}
</script>
