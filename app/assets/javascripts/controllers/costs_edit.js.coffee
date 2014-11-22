Cloud9Core.CostsEditController = Ember.ObjectController.extend(

  deactivateCosts: (->



  ).property()

  actions:
    changeCost: ->
      @get('model').save().then =>
        @transitionToRoute() 'product'

    cancel: ->
      @get('model').rollback()
      @transitionToRoute 'lead'

)