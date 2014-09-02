App.ExpensesRoute = App.AuthenticatedRoute.extend

  model: -> @store.find 'expense'
