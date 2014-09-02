App.ExpenseEditRoute = Ember.Route.extend

  activate:   -> @controllerFor('expense').set 'isEditing', true
  deactivate: -> @controllerFor('expense').set 'isEditing', false