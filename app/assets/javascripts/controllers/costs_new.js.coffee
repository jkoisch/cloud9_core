Cloud9Core.CostsNewController = Ember.Controller.extend(

  needs: ['product']

  fields: {}

  actions:
    saveCost: (->
      p_id = @controllerFor('product').model.get('id')
      cost = @store.createRecord 'cost', @get('fields')
      cost.set('product_id', p_id)
      cost.save().then =>
        old_product = @controllerFor('product').model
        old_product.reload()
        @transitionToRoute '/products/' + p_id

    )
)