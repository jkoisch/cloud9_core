Cloud9Core.OpportunitiesSearchController = Ember.ArrayController.extend(

  init: ->
    @_super()
    console.log "In Opportunity Search Controller"
    @set('search','')

  actions:

    searchOpportunity: ->
      search = @get('search')
      console.log 'About to go to ONE Opportunity      ' + search
      @transitionToRoute '/opportunities/' + search


)