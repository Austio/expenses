App.ReportController = Ember.Controller.extend({

    setup: function() {
        var expenses_by_week = $.get('/api/reports')
        alert(expenses_by_week)

//        var self = this, data = this.getProperties('email', 'password');
//
//        // Clear out any error messages.
//        this.set('errorMessage', null);
//
//        $.post('/api/sessions', data).then(function(response) {
//            self.set('errorMessage', response.message);
//            if (response.success) {
//                alert('Login succeeded!');
//                self.set('token', response.token);
//
//                App.ApplicationAdapter = DS.ActiveModelAdapter.reopen({
//                    headers: {
//                        "API_KEY": localStorage.token
//                    }
//                })
//
//                self.transitionToRoute('expenses');
//
//            }
//        });
    }
});