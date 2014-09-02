App.ExpenseRoute = Ember.Route.extend

  model: (params) -> @store.find 'expense', params.id