App.ExpenseController = Ember.ObjectController.extend

  actions:
    saveChanges: -> @get('model').save()