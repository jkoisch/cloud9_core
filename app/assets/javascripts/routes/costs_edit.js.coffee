Cloud9Core.CostsEditRoute = Ember.Route.extend(
  model: ->
    return @modelFor('costs')
  renderTemplate: ->
    @render "costs.edit",
      into: "costs"
      outlet: "edit-details"
)