Cloud9Core.CostsNewRoute = Ember.Route.extend(
  model: ->
    return @controllerFor('product').get('model')
  setupController: (controller) ->
    controller.set 'fields', {}
  renderTemplate: ->
    @render "costs.new",
      into: "costs"
)