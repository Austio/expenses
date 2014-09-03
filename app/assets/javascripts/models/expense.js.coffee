App.Expense = DS.Model.extend
  comment:     DS.attr('string')
  amount:      DS.attr('number')
  date:        DS.attr('date')
  time:        DS.attr('string')
  description: DS.attr('string')

App.Expense.reopenClass

  valid: (fields) ->
    fields.description and fields.amount