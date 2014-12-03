Cloud9Core.CostsEditController = Ember.ObjectController.extend(

  actions:

    makeCostActive: ->
      @get('model').save().then =>
        old_product = @controllerFor('product').model
        old_product.reload()
        @transitionToRoute '/products/' + old_product.id

)