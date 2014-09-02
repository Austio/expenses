App.ExpensesNewController = Ember.Controller.extend

  actions:

    createExpense: ->
      expense = @store.createRecord 'expense', @get('fields')
      expense.save.then() =>
        @transitionToRoute 'lead', lead