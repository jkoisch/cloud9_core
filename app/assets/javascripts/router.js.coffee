Cloud9Core.Router.reopen
  rootURL: '/'
  location: 'auto'

Cloud9Core.Router.map ->
#  @resource 'opportunity', path: '/opportunities/:id', ->
#    @route 'edit'
  @resource 'opportunities', path: '/opportunities', (->
    @route 'search', path: '/search'
    @resource 'opportunity', path: '/:id'
  )
  @resource 'customers'
  @resource 'groups'
  @resource 'products', path: '/products', ->
    @resource 'product', path: '/:id', ->
      @route 'edit', path: 'edit'
      @resource 'costs', path: '/costs', ->
        @route 'new', path: '/new'
      @resource 'prices', path: '/prices', ->
        @route 'new', path: '/new'
  @route 'about'