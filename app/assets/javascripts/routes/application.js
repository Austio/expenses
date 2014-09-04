//head route for global functions
App.ApplicationRoute = Ember.Route.extend({
    actions: {
        logoutUser: function(transition, originRoute) {
            localStorage.clear();
            alert("Logged Out Successfully!")
            this.transitionTo('login')
        }
    }
});