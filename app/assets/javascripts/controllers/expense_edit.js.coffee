App.ExpenseEditController = Ember.ObjectController.extend

  actions:

    saveChanges: ->
      @get('model').save().then =>
        @transitionToRoute 'expense'

    cancel: ->
      @get('model').rollback()
      @transitionToRoute 'expense'