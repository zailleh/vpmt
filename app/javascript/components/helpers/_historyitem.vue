<script>
export default {
  props: {
    component: Object,
    params: Object
  },
  render(createElement) {
    return createElement(this.component, { props: this.params } )
  },
}
</script>