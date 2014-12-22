Cloud9Core.Router.reopen
  rootURL: '/'
  location: 'auto'

Cloud9Core.Router.map ->
  @resource 'opportunities', path: '/opportunities', ->
    @resource 'opportunity', path: '/:id'
    @route 'search', path: '/search'
  @resource 'customers', path: '/customers', ->
    @resource 'customer', path: '/:id'
  @resource 'systems', path: '/systems', ->
    @resource 'system', path: '/:id'
  @resource 'groups'
  @resource 'product_types'
  @resource 'products', path: '/products', ->
    @route 'new', path: 'new'
    @resource 'product', path: '/:id', ->
      @route 'edit', path: 'edit'
      @resource 'costs', path: '/costs', ->
        @route 'new', path: '/new'
      @resource 'prices', path: '/prices', ->
        @route 'new', path: '/new'
  @route 'about'