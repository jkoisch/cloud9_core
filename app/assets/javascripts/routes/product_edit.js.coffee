Cloud9Core.ProductEditRoute = Ember.Route.extend(
  productTypeList: null
  model: ->
    return @modelFor('product')
  afterModel: (model)->
    @productTypeList = @store.find('productType')
  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set('types', @productTypeList)
  renderTemplate: ->
    @render "product.edit",
      into: "products"
      outlet: "details"
)