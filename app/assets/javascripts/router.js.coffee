Cloud9Core.Router.reopen
  rootURL: '/'
  location: 'auto'

Cloud9Core.Router.map ->
#  @resource 'opportunity', path: '/opportunities/:id', ->
#    @route 'edit'
  @resource 'opportunities'
  @resource 'customers'
  @resource 'products', path: '/products', ->
    @resource 'product', path: '/:id', ->
      @resource 'costs', path: '/costs', ->
        @route 'edit', path: '/:cost_id'
  @route 'about'