App.ExpensesController = Ember.ArrayController.extend
  sortProperties: ['amount']

  expenses: ( ->
    if @get('search') then @get('searchedExpenses') else @
  ).property('search', 'searchedExpenses')

  searchedExpenses: ( ->
    search = @get('search').toLowerCase()
    @filter (expense) => expense.get('description').toLowerCase().indexOf(search) != -1
  ).property('search', '@each.description')