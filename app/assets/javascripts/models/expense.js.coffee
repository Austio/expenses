App.Expense = DS.Model.extend
  comment: DS.attr('string')
  amount:  DS.attr('number')
  date:    DS.attr('date')

App.Expense.reopenClass

  valid: (fields) ->
    fields.comment and fields.date and fields.amount