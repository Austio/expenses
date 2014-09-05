# For more information see: http://emberjs.com/guides/routing/

App.Router.map ->
  @resource 'expenses', path: '/expenses', ->
    @route 'new'
    @resource 'expense', path: '/expenses/:id', ->
      @route 'edit'
  @route 'signup', path: '/'
  @route 'login', path: '/login'
  @route 'report', path: '/report'