Cloud9Core.ProductsRoute = Ember.Route.extend

  model: -> @store.find 'product'