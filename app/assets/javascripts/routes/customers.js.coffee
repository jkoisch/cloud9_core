Cloud9Core.CustomersRoute = Ember.Route.extend
  model: -> @store.find 'customer'