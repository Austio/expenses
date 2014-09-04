App.LogoutController = Ember.Controller.extend({
    actions: {
        logoutUser: function () {
            alert('howdy')
            localStorage.clear()
        }
    }
});