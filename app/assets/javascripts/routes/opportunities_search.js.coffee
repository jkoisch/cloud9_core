Cloud9Core.OpportunitiesSearchRoute = Ember.Route.extend(

  renderTemplate: ->
    @render "opportunities.search",
      outlet: "details"
      into: "opportunities"

)