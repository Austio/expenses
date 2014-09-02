App.ExpenseRoute = App.AuthenticatedRoute.extend

  model: (params) -> @store.find 'expense', params.id