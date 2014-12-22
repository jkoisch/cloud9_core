Cloud9Core.ProductsNewRoute = Ember.Route.extend
  productTypeList: null
  afterModel: (model)->
    @productTypeList = @store.find('productType')
  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'fields', {}
    controller.set 'types', @productTypeList
  renderTemplate: ->
    @render "products.new",
      outlet: "details"