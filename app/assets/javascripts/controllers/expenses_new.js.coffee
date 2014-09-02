App.ExpensesNewController = Ember.Controller.extend

  actions:

    createExpense: ->
      fields = @get('fields')
      if App.Expense.valid(fields)
        expense = @store.createRecord 'expense', @get('fields')
        expense.save().then =>
          @transitionToRoute 'expense', expense
      else
        @set 'showError', true