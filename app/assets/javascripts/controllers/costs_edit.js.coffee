Cloud9Core.CostsEditController = Ember.ObjectController.extend(

  actions:

    makeCostActive: ->
      @get('model').save().then =>
        console.log 'here'
        old_product = @controllerFor('product').model
        console.log old_product
        console.log old_product.id
        old_product.reload()
        @transitionToRoute '/products/' + old_product.id

)