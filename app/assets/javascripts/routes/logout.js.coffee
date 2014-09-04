App.LogoutRoute = Ember.Route.extend

  beforeModel: ->
    alert('hi')
    localStorage.clear()
    this.transitionTo('login')

