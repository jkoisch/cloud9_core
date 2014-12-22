Cloud9Core.ProductsNewController = Ember.Controller.extend
  types: null

  actions:

    createProduct: ->
      product = @store.createRecord 'product', @get('fields')
      product.save().then =>
        @transitionToRoute 'product', product