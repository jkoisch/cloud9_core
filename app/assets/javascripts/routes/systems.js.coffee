Cloud9Core.SystemsRoute = Ember.Route.extend
  model: -> @store.find 'system'