Cloud9Core.OpportunitiesRoute = Ember.Route.extend
  init: ->
    console.log "In OpportunitiesROUTE"
    @_super()

  model: -> @store.find 'opportunity'
