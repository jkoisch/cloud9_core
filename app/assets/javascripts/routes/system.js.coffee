Cloud9Core.SystemRoute = Ember.Route.extend
  thisCustomer: null
  model: (params) -> @store.find('system', params.id)
  afterModel: (model)->
    @thisCustomer = @store.find('customer', model.get('customerId'))
  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set('customerName', @thisCustomer.get('fullFormalName'))
    controller.set('orgName', @thisCustomer.get('organizationName'))
  renderTemplate: ->
    @render "system",
      outlet: "details"