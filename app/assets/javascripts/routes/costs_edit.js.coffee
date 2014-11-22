Cloud9Core.CostsEditRouter = Ember.Router.extend(
  renderTemplate: ->
    @render "costs.edit",
      into: 'products'
      outlet: "edit-details"

)