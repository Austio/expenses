//head route for global functions
App.ApplicationRoute = Ember.Route.extend({
    //TODO delete the token from server
    actions: {
        logoutUser: function(transition, originRoute) {
            $.ajax({
                url:  '/api/sessions/logout',
                type: 'POST',
                data:  {"key":localStorage.token}
            })
            delete localStorage.token;
            this.transitionTo('login');
            alert("Logged Out Successfully!")
            location.reload();
        }
    }
    //TODO deal with someone having a token that doesn't go anywhere
});