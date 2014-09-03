# For more information see: http://emberjs.com/guides/routing/

App.Router.map ->
  @resource 'expenses', path: '/', ->
    @route 'new'
    @resource 'expense', path: '/expenses/:id', ->
      @route 'edit'
  @route 'signup'
  @route 'login'
  @route 'logout'
