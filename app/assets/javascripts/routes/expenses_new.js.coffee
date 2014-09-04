App.ExpensesNewRoute = App.AuthenticatedRoute.extend

  setupController: (controller) ->
    controller.set 'fields', {}
    controller.set 'showError', false


