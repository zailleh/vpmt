module.exports.makePopup = {
  methods: {
    popup(Component, params) {
      this.$root.$children[0].displayPopup(Component, params);
    },
  }
};

module.exports.closePopup = {
  methods: {
    close() {
      this.$root.$children[0].closePopup();
    }
  }
}