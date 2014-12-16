Cloud9Core.CustomerRoute = Ember.Route.extend
  model: (params) -> @store.find('customer', params.id)
  setupController: (controller, model) ->
    controller.set 'model', model
  renderTemplate: ->
    @render "customer",
      outlet: "details"