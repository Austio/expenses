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
            App.ApplicationAdapter = DS.ActiveModelAdapter.reopen({
                headers: {
                    "API_KEY": ''
                }
            })

            alert("Logged Out Successfully!")
            location.reload(); //clear all the data from browser
            this.transitionTo('login');
        }
    }
    //TODO deal with someone having a token that doesn't go anywhere
});