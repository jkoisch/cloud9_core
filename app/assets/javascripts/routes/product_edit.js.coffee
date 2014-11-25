Cloud9Core.ProductEditRoute = Ember.Route.extend(
  model: ->
    return @modelFor('product')
  renderTemplate: ->
    @render "product.edit",
      into: "products"
      outlet: "details"
)