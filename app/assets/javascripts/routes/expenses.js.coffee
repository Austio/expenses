App.ExpensesRoute = Ember.Route.extend
  model: -> @store.find 'expense'