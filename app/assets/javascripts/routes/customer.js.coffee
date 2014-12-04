Cloud9Core.CustomerRoute = Ember.Route.extend
  model: (params) -> @store.find('customer', params.id)
  renderTemplate: ->
    @render "customer",
      outlet: "details"