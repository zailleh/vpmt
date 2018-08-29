<script>
import ClosePopup from './helpers/_closepopup.vue';
import { closePopup } from './helpers/_makePopup.js';

export default {
  props: {
    content: Object,
    params: Object
  },
  created: function () {
    window.addEventListener('keydown', (e) => {
      if (e.keyCode == 27) { // escape key maps to keycode `27`
        console.log('escape pressed');
        this.closePopup();
      }
    });
  },
  render(createElement) {
      return createElement('div',[
          createElement(ClosePopup),
          createElement(this.content, { props: this.params } )
        ]
      );
  },
  mixins: [ closePopup ],
}
</script>
