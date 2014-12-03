Cloud9Core.OpportunityRoute = Ember.Route.extend(
  init: ->
    @_super()
    console.log "IN OpportunityRoute SINGULAR"
  model: (params) ->
    console.log params.id
    return @store.find('opportunity', params.id)
  renderTemplate: ->
    @render "opportunity",
      outlet: "details"
      into: "opportunities"
)