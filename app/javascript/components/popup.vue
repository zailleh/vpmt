<script>
import ClosePopup from './helpers/_closepopup.vue';

export default {
  props: {
    content: Object,
    params: Object
  },
  render(createElement) {
      return createElement('div',[
          createElement(ClosePopup),
          createElement(this.content, { props: this.params } )
        ]
      );
    },
}
</script>
