App.Expense = DS.Model.extend
  comment: DS.attr('string')
  amount:  DS.attr('number')
  date:    DS.attr('date')