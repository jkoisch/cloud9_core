# app/assets/javascripts/routes/lead.js.coffee
Cloud9Core.CostsRoute = Ember.Route.extend
  renderTemplate: ->
    @render "costs",
      into: "products"
      outlet: "sub-details"



