App.ReportController = Ember.Controller.extend({

    setup: function() {
        var self = this;
        $.ajax({
            type: 'GET',
            url: '/api/reports',
            headers: {
                "API_KEY": localStorage.token
            }

        }).then(function(response){


            console.log(response)

            outArray = []
            for (var k in response) {
              outArray.push({
                  key: k,
                  amount: response[k]["amount"],
                  average: response[k]["average"],
                  total_expenses: response[k]["total_expenses"]

              })
            }


            self.set('expensesByWeek',  outArray);
        })

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