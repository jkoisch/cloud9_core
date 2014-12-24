Cloud9Core.CustomerRoute = Ember.Route.extend
  components: null
  model: (params) -> @store.find('customer', params.id)
  afterModel: (model)->
    @components = @store.find('component',{ customerId: model.get('customerId') } )
  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set('comps', @components)
  renderTemplate: ->
    @render "customer",
      outlet: "details"