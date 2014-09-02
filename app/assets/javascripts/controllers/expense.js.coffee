App.ExpenseController = Ember.ObjectController.extend

  actions:
    saveChanges: -> @get('model').save() if @get('model.isDirty')

  showUnsavedMessage: ( ->
    @get('isDirty') and !@get('isSaving')
  ).property('isDirty','isSaving')