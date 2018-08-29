export default {
  data: function() {
    return {
      staff_name: '',
      staff_id: '',
      suggestions: [],
    }
  },
  methods: {
    selectStaff(staff) {
      this.staff_name = staff.first_name + ' ' + staff.last_name;
      this.staff_id = staff.id;
      this.suggestions = [];
    },
    getSuggestions() {
      if (this.staff_name.length < 3) {
        this.suggestions = []
        this.staff_id = ''
      } else {
        this.staff_id = ''
        fetch('/search/staff.json', {
          method: "POST", // *GET, POST, PUT, DELETE, etc.
          credentials: "same-origin", // include, same-origin, *omit
          headers: {
              "Content-Type": "application/json; charset=utf-8",
          },
          redirect: "follow", // manual, *follow, error
          referrer: "no-referrer", // no-referrer, *client
          body: JSON.stringify({ search: this.$data.staff_name })
        })
        .then(function(response){ return response.json()})
        .then((function(data) {
          this.suggestions = data
        }).bind(this))
      }
    },
  }
}