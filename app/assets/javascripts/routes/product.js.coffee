Cloud9Core.ProductRoute = Ember.Route.extend

  model: (params) -> @store.find('product', params.id)
  renderTemplate: ->
    @render "product",
      outlet: "details"



