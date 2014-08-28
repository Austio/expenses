App.Expense = DS.Model.extend
  date: DS.attr('date')
  amount: DS.attr('number')
  comment: DS.attr('string')
