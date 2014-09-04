//head route for global functions
App.ApplicationRoute = Ember.Route.extend({
    //TODO delete the token from server
    actions: {
        logoutUser: function(transition, originRoute) {
            $.ajax({
                url:  'api/logout',
                type: 'POST',
                data:  {"key":localStorage['token']}
            })
            localStorage.clear();
            alert("Logged Out Successfully!")
            this.transitionTo('login')
        }
    }
});