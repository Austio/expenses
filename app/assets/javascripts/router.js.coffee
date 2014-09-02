# For more information see: http://emberjs.com/guides/routing/

App.Router.map ->
  @resource 'expenses', path: '/', ->
    @resource 'expense', path: '/expenses/:id'
