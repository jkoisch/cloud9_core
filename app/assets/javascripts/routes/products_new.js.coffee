Cloud9Core.ProductsNewRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set 'fields', {}


  renderTemplate: ->
    @render "products.new",
      outlet: "details"