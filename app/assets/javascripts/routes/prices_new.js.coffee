Cloud9Core.PricesNewRoute = Ember.Route.extend(
  model: ->
    return @controllerFor('product').get('model')
  setupController: (controller) ->
    controller.set 'fields', {}
  renderTemplate: ->
    @render "prices.new",
      into: "prices"
)