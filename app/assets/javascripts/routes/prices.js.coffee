# app/assets/javascripts/routes/lead.js.coffee
Cloud9Core.PricesRoute = Ember.Route.extend
  renderTemplate: ->
    @render "prices",
      into: "products"
      outlet: "sub-details"