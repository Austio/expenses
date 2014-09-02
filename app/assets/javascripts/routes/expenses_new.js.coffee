App.ExpensesNewRoute = Ember.Route.extend

  setupController: (controller) ->
    controller.set 'fields', {}
