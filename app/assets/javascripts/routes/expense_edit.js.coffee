App.ExpenseEditRoute = App.AuthenticatedRoute.extend

  activate:   -> @controllerFor('expense').set 'isEditing', true
  deactivate: -> @controllerFor('expense').set 'isEditing', false