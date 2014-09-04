App.LoginController = Ember.Controller.extend({

    reset: function() {
        this.setProperties({
            email: "",
            password: "",
            errorMessage: ""
        });
    },

    token: localStorage.token,
    tokenChanged: function() {
        localStorage.token = this.get('token');
    }.observes('token'),

    login: function() {

        var self = this, data = this.getProperties('email', 'password');

        // Clear out any error messages.
        this.set('errorMessage', null);

        $.post('/api/sessions', data).then(function(response) {
            self.set('errorMessage', response.message);
            if (response.success) {
                alert('Login succeeded!');
                self.set('token', response.token);

                App.ApplicationAdapter = DS.ActiveModelAdapter.reopen({
                    headers: {
                        "API_KEY": localStorage.token
                    }
                })

                self.transitionToRoute('expenses');

            }
        });
    }
});