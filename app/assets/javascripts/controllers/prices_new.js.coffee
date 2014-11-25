Cloud9Core.PricesNewController = Ember.Controller.extend(

  needs: ['product']

  fields: {}

  actions:
    savePrice: ((params)->
      p_id = @controllerFor('product').model.get('id')
      price = @store.createRecord 'price', @get('fields')
      price.set('product_id', p_id)
      price.save().then =>
        old_product = @controllerFor('product').model
        old_product.reload()
        @transitionToRoute '/products/' + p_id

    )
)